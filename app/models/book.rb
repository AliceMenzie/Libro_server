class Book < ApplicationRecord
  validates :author, :title, :genre, :year, :status, presence: true
  validates_format_of :status, { with: /unread|read/, message: "status can only be read or unread" }
  has_one :review, dependent: :destroy
  belongs_to :user
end
