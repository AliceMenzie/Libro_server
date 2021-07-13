class Book < ApplicationRecord
    validates :author, :title, :genre, :status, presence: true
end

