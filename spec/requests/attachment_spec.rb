RSpec.shared_examples 'Attachment' do |file_ext, entity_name, model|
  let(:file_path) do
    File.join(
      model::UPLOADS_DIR,
      entity_name.pluralize,
      Rails.env,
      "#{model.last.id}.#{file_ext}"
    )
  end
  model_name = model.name.tableize.singularize
  
  before do
    visit send("new_#{model_name}_path")
    
    case model_name
    when "film"
      fill_in 'film[name]', with: model.random_value_of(:name)
    end
    
    attach_file(
      "#{model_name}_#{entity_name}",
      File.absolute_path("public/test.#{file_ext}")
    )
    click_button "Create #{model_name}"
  end
  
  after do |example|
    # byebug if example.exception
  end
  
  # On Film creation
  context "On #{model} creation" do
    after do
      model.destroy_all
      model.reset_autoincrement
    end
    
    # it stores file in public/uploads/video_files/
    it "stores file in #{model::UPLOADS_DIR}/#{entity_name.pluralize}/" do
      expect(model.last).to_not be nil
      expect(File).to exist(file_path)
    end
  end
  
  context "On #{model} deletion" do
    # removed from public/uploads/video_files/
    it "removed from #{model::UPLOADS_DIR}/#{entity_name.pluralize}/" do
      path_to_file_that_will_remove = file_path
      model.destroy_all
      model.reset_autoincrement
      expect(model.last).to be nil
      expect(File).to_not exist(path_to_file_that_will_remove)
    end
  end
end

{ Film => { 'poster' => 'jpg', 'video' => 'avi' } }.each do |model, entities|
  entities.each do |ent, ext|
    RSpec.describe ent.titlecase do
      it_behaves_like 'Attachment', ext, "#{ent}_file", model
    end
  end
end

