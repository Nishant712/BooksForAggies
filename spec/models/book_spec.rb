require 'rails_helper'
require 'spec_helper'

RSpec.describe Book, type: :model do
  subject { described_class.new(title: "some title", author: "some_author", category: "some category", isbn_no: "978-3-16-148410-0", edition: "some edition", abstract: "some abstract", publisher: "some publisher", descriptors: "some desc", user_id: 1 ) }

  context "while adding new book into table" do
    it "title should not be empty" do
      # should validate_presence_of(:title)
      should validate_presence_of(:title)
    end

    it "author should not be empty" do
      should validate_presence_of(:author)
    end

    it "abstract should not be empty" do
      should validate_presence_of(:abstract)
    end

    it "isbn-number should be in proper format" do
      should allow_value("978-3-16-148410-0").for(:isbn_no)
      should_not allow_value("9783161484100").for(:isbn_no)
    end

  end

 
    
end
