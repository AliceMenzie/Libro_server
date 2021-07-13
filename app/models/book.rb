class Book < ApplicationRecord
    validates :author, :title, :genre, :status, presence: true
    has_one :review
end

