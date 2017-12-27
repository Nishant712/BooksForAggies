require 'rails_helper'
require 'spec_helper'

RSpec.describe ShowController, type: :controller do

  describe "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template 'show#index'
    end
  end

  describe "GET create" do
  context "with valid attributes" do
    it "creates a new request" do
      expect{
        get :requesting, params: FactoryGirl.attributes_for(:request)
      }.to change(Request,:count).by(1)
    end
    
    
  end
  
  
end

  describe "#books" do
    it "returns http success" do
      get :books
      expect(response).to have_http_status(:success)
    end
    it "renders the :books view" do
      get :books
      expect(response).to render_template :books
    end
    it "if session has no key" do
      session[:currentName] = nil
      get :books
      if session.has_key?(:currentName)
         @loginTab = "Login/Signup"
      end
      
      expect(@loginTab).to eq "Login/Signup"
    end
    it "login tab is login/signup" do
      get :books
      flag = session.has_key?(:currentName)
      expect(flag).to eq false
    end
    it "login tab is login/signup" do
      get :books
      
      expect(@loginTab).to eq session[:currentName]
    end
    it "login tab is login/signup" do
      get :books
      flag = session.has_key?(:currentName)
      expect(flag).to eq false
    end
  end
end
