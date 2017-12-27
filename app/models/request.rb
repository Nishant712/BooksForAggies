class Request < ApplicationRecord
  #validates :user_id, presence: true
  validates :book_id, presence: true
end
