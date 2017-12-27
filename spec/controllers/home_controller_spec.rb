require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "#logout" do
  	it "logs out user" do
  	expect(response).to have_http_status(:success)
  	end
	it "if session does not have key" do
          flag = session.has_key?(:currentName)
 	  expect(flag).to be false
  	end
        it "if session does not have key, redirects to root path" do
          flag = session.has_key?(:currentName)
 	  expect(flag).to be false
          expect(response).to redirect_to root_path
  	end
  end

 describe "#book" do
 	it "ifsession has key" do
 	  expect(response).to have_http_status(:success)
  	end
        it "if session has key, flag has_key is true" do
          session[:currentName] = 'abcd'
          flag = session.has_key?(:currentName)
 	  expect(flag).to be true
  	end
        it "if session does have a key, then redirects to book" do
          session[:currentName] = 'abcd'
          get :book, params: session[:currentName]
          expect(response).to redirect_to '/book'
          
  	end
        it "if session has no key, flag has_key is false" do
          flag = session.has_key?(:currentName)
 	  expect(flag).to be false
  	end
        it "if session does not have a key, then redirects to user" do
          get :book, params: session[:currentName]
          expect(response).to redirect_to '/book'
          
  	end
  end


end
