class User < ApplicationRecord
  has_many :posts
  has_many :images, as: :imageable

  EMAIL_VALID = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 63 }
  validates :email, format: { with: EMAIL_VALID }

  def full_name
    "#{first_name} #{last_name} "
  end
end
