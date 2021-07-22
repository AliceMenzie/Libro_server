class User < ApplicationRecord
  has_secure_password
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validates :password, length: { minimum: 6 }
  validates_format_of :username, { with: /\A\w+\z/, message: "Username can only contain alphumeric characters" }
  has_many :books, dependent: :destroy
end
