require 'rails_helper'

RSpec.describe FindController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "#signin" do
  	it "signin successful" do
  	get :signin
    expect(response).to redirect_to('/users')
  end
end

end
