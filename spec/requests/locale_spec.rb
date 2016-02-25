RSpec.describe "locale detection" do
  describe "new user visit", js: true do
    it "detects user locale by http header or sets default" do
      visit root_path
      expect(page).to have_selector("#application_locale", text: "English")
    end
  end
end

