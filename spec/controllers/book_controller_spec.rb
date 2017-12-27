require 'rails_helper'
require 'spec_helper'

describe BookController, type: :controller do

  describe "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

describe "GET create" do
  context "with valid attributes" do
    it "creates a new book" do
      expect{
        get :create, params:  FactoryGirl.attributes_for(:book)
      }.to change(Book,:count).by(1)
    end
    it "check if object of class Book" do
      book1 = get :create, params:  FactoryGirl.attributes_for(:book) 
      expect{ get :create, params:  FactoryGirl.attributes_for(:book) }.to_not raise_error
    end
    
  end

  context "with invalid attributes" do
    it "does not save the new book" do
      expect{ get :create, params:  FactoryGirl.attributes_for(:invalid_book) }.to raise_error
    end
  end
  
  
end


describe 'DELETE destroy' do
  before :each do
    @book = FactoryGirl.create(:book)
  end
  
  it "deletes the book" do
    expect{
      get :delete, params: { id: @book.id }        
    }.to change(Book,:count).by(-1)
  end
    
  it "redirects to #index" do
    get :delete, params: { id: @book.id }
    expect(response).to redirect_to('/book')
  end
end

describe "#edit" do
  before :each do
    @book = FactoryGirl.create(:book)
  end
  it "Check book edit" do
    get :edit, params: { id: @book.id }
    expect(response).to render_template("index")
  end
end

describe 'PUT update' do
  before :each do
    @book = FactoryGirl.create(:book, title: "Name", author: "Smith")
  end
  
  context "valid attributes" do
    it "located the requested @contact" do
      put :update, params: { id: @book.id }, params: { book: FactoryGirl.attributes_for(:book) }
      assigns(:book).should eq(@book)      
    end
  
    it "changes @book's attributes" do
      put :update, params: { id: @book.id }, 
        params: FactoryGirl.attributes_for(:book, firstname: "Larry", lastname: "Smith")
      @book.reload
      @contact.title.should eq("Larry")
      @contact.author.should eq("Smith")
    end
  
    
  end
  
  context "invalid attributes" do
    it "locates the requested @contact" do
      put :update, params: { id: @book.id }, book: FactoryGirl.attributes_for(:invalid_book)
      assigns(:book).should eq(@book)      
    end
    
    it "does not change @contact's attributes" do
      put :update, params: { id: @book.id }, 
        book: FactoryGirl.attributes_for(:book, firstname: "Larry", lastname: nil)
      @contact.reload
      @contact.firstname.should_not eq("Larry")
      @contact.lastname.should eq("Smith")
    end
    
  end
end

describe "#signin" do
  let(:param) { {Email: "palparmar", Password: "p"}}
  it "signin successful" do
    get :signin
    # expect(helper.param[:currentName]).to eq "palash"
    expect(response).to redirect_to('/users')
  end
  it "signin unsuccessful" do
    get :signin
    expect(response).to redirect_to('/users')
  end
end

describe "#signout" do
  it "signout successful" do
    get :signout
    expect(response).to redirect_to('/')
  end
end


end


