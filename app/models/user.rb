class User < ApplicationRecord
  EMAIL_VALID = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :posts
  has_many :images, as: :imageable

  scope :adults, -> { where('birthday <= ?', 18.years.ago) }

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 63 }
  validates :email, presence: true, format: { with: EMAIL_VALID }, uniqueness: true

  def full_name
    "#{first_name} #{last_name} "
  end
end
