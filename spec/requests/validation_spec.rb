RSpec.describe 'film creation validation' do
  let(:random_name) { Film.random_value_of(:name) }
  let(:random_description) { Film.random_value_of(:description) }
  let(:too_long_name) { Film.too_long_random_value_of(:name) }
  let(:too_long_description) { Film.too_long_random_value_of(:description) }
  let(:created_film) { Film.last }
  let(:success_message_selector) { [ '#notice', { text: 'film created' } ] }
  let(:error_li) { '#error_explanation>ul>li' }
  
  before do
    visit new_film_path
  end
  
  after do
    Film.destroy_all
  end
  
  describe 'valid user input' do
    before do
      fill_in 'film[name]', with: random_name
      fill_in 'film[description]', with: random_description
      click_button 'Create film'
    end
    
    it 'creates new film in database and shows success message' do
      expect(created_film).to_not be nil
      expect(page).to have_selector(*success_message_selector)
    end
  end
  
  describe 'no user input' do
    before do
      click_button 'Create film'
    end
    
    it "don't creates film in database and shows error message" do
      expect(created_film).to be nil
      expect(page).to have_selector(error_li, text: "name can't be blank")
    end
  end
  
  describe 'if too long name entered' do
    before do
      fill_in 'film[name]', with: too_long_name
      click_button 'Create film'
    end
    
    it 'creates new film in DB with cropped name and shows success message' do
      expect(created_film).to_not be nil
      expect(page).to have_selector(*success_message_selector)
    end
  end
  
  describe 'if too long description entered' do
    before do
      fill_in 'film[name]', with: random_name
      fill_in 'film[description]', with: too_long_description
      click_button 'Create film'
    end
    
    it 'creates new film in DB with cropped desc. and shows success message' do
      expect(created_film).to_not be nil
      expect(page).to have_selector(*success_message_selector)
    end
  end
  
  describe 'if too long name entered after javascript manipulation', js: true do
    before do
      page.execute_script(
        "document.getElementById('film_name').attributes.maxlength.value='';"
      )
      fill_in 'film[name]', with: too_long_name
      click_button 'Create film'
    end
    
    it "don't creates film in database and shows error message" do
      expect(created_film).to be nil
      expect(page).to have_selector(error_li, text: 'name is too long')
    end
  end
end

