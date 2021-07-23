class Book < ApplicationRecord
  validates :author, :title, :genre, :year, :status, presence: true
  has_one :review, dependent: :destroy
  belongs_to :user
  has_one_attached :bookimage
end
