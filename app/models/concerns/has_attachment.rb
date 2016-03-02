module HasAttachment
  UPLOADS_DIR = 'public/uploads'
  EXTENTIONS = { 'poster_file' => %w(jpg), 'video_file' => %w(webm) }
  CONVERT_LIBS = { 'webm' => 'libvpx' }
  
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
      
      result.store_attachments(attachments) if result.valid?
      
      result
    end
  end

  def attachment_file_paths(type = nil)
    self.attributes.select do |key, _val|
      key.match(/#{type}_file$/)
    end.select do |_key, val|
      val
    end.keys.map do |entity_name|
      file_name = "#{self.id.to_s}.#{EXTENTIONS[entity_name]}"
      File.join(UPLOADS_DIR, entity_name.pluralize, Rails.env, "#{file_name}")
    end
  end
  
  def destroy_attachments
    attachment_file_paths.each do |attachment_file_path|
      FileUtils.rm(attachment_file_path) if File.exist?(attachment_file_path)
    end
  end

  def store_attachments attachments
    attachments.each do |key, value|
      EXTENTIONS[key].each do |ext|
        new_path = File.join(
          UPLOADS_DIR,
          key.pluralize,
          Rails.env,
          "#{self.id}.#{ext}"
        )
        case
        when value.content_type["video/"]
          options = { video_codec: CONVERT_LIBS[ext] }
          FFMPEG::Movie.new(value.path).transcode(new_path, options) do |progress|
            puts progress
          end
        else
          FileUtils.cp(value.path, new_path)
        end
        FileUtils.rm(value.path)
      end
    end
  end
end
