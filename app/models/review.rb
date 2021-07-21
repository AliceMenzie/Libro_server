class Review < ApplicationRecord
  validates :description, length: { maximum: 300 }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5  }
  belongs_to :book
end
