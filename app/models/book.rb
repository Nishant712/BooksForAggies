class Book < ApplicationRecord
	#belongs_to :user
	validates :title, presence: true
	validates :author, presence: true
	validates :abstract, presence: true
	validates :isbn_no, :format => {:with => /\d{3}[-]\d{1,5}[-]\d{1,7}[-]\d{1,6}[-]\d{1}/}
end
