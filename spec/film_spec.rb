RSpec.describe FilmsController, "#create" do
  it "should create record in database" do
    visit films_path
    response.should have_tag "input[name=?][value]", "film[name]"
  end
end
