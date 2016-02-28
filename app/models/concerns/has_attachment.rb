module HasAttachment
  UPLOADS_DIR = 'uploads'
  EXTENTIONS = { 'poster_file' => 'jpg', 'video_file' => 'avi' }
  
  def self.included c
    c.extend ClassMethods
    c.after_destroy :destroy_attachments
  end
  
  module ClassMethods
    def create_with_attachments attributes
      attachments = {}
      
      result = self.create Hash[attributes.map do |key, value|
        if value.class == ActionDispatch::Http::UploadedFile
          attachments[key] = value
          value = true
        end
        [key, value]
      end]
      
      attachments.each do |key, value|
        file_name = "#{result.id.to_s}.#{EXTENTIONS[key]}"
        FileUtils.mv(
          value.path,
          File.join(UPLOADS_DIR, key.pluralize, Rails.env, "#{file_name}")
        )
      end if result.valid?
      
      result
    end
  
  end
  
  def destroy_attachments
    attachments.each do |attachment|
      FileUtils.rm(attachment) if File.exist?(attachment)
    end
  end
  
  def attachments
    self.attributes.select do |key, _val|
      key.match(/_file$/)
    end.select do |_key, val|
      val
    end.keys.map do |entity_name|
      file_name = "#{self.id.to_s}.#{EXTENTIONS[entity_name]}"
      File.join(UPLOADS_DIR, entity_name.pluralize, Rails.env, "#{file_name}")
    end
  end
  
end
