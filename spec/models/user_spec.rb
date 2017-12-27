require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  subject { described_class.new(username: "some username", password_digest: "some_password", email: "john@tamu.edu") }
  context "creating new user" do
    it "should have non empty username" do
      should validate_presence_of(:username)
    end
    it "should have valid username length" do
      should validate_length_of(:username).is_at_least(3).is_at_most(25)

    end

    it "should have non empty email" do
      should validate_presence_of(:email)
    end
    it "should have vaild email" do
      should allow_value("palash@tamu.edu").for(:email)
      should_not allow_value("palash@tamuedu").for(:email)
    end


    it "should have unique email" do
      should validate_uniqueness_of(:email)
    end

    it "should have unique username" do

      should validate_uniqueness_of(:username)
    end


  end
  context "Checking associations with other tables it" do


    it "should associated with many books" do
      should have_many(:books)
    end
  end
end
