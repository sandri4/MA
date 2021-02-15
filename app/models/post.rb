class Post < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  accepts_nested_attributes_for :images
  scope :published, -> { where.not(published_at: nil) }

  def publish!
    update(published_at: Time.now)
  end

  def unpublish!
    update(published_at: nil)
  end
end
