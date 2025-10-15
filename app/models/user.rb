class User < ApplicationRecord
  has_secure_password
  with_options dependent: :destroy do 
    has_many :sessions
    has_many :posts
    has_many :comments
  end

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def name
    email_address
  end
end
