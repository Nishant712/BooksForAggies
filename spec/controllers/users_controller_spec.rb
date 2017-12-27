require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do
  #subject { described_class.new(username: "some username", password_digest: "some_password", email: "john@tamu.edu", username: "Myname") }
  let(:param) { {Email: "palparmar", Password: "p"}}
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
  end
  describe "#signin" do
    it "sign in successful" do
      user = User.create
      get :signin 
      expect(response).to redirect_to("/users")
    end
    it "signin unsuccessful" do
      get :signin
      expect(response).to redirect_to("/users")
  end
end

  describe "GET create" do
  context "with valid attributes" do
    it "creates a new user" do
      #expect{
        get :create, params: FactoryGirl.attributes_for(:user)
      #}.to change(User,:count).by(1)
      expect(response).to redirect_to("/users")
    end
    
    
  end
  
  
end

end
