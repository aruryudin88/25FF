require 'shared_examples_for_resources'

RSpec.describe ResourcesController do
  let(:model) { request.path[%r(^/([^/]+).*$), 1].classify.constantize }
  
  after do
    model.destroy_all
  end
  
  describe "GET #index" do
    it_behaves_like "resources controller action"

    it "renders the index template" do
      get :index
      
      expect(response).to render_template("index")
    end

    it "loads all of the resources into @resources" do
      resources = Array.new(3) do |i|
        Film.create! name: Film.random_value_of(:name)
      end
      
      get :index
      
      expect(assigns(:resources)).to match_array(resources)
    end
  end
  
  describe "GET #new" do
    it_behaves_like "resources controller action"
  end
end
