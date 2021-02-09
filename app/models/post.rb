class Post < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable

  scope :published, -> { where.not(published_at: nil) }
  def publish!
    update(published_at: Time.now)
  end
end
