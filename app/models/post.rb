# frozen_string_literal: true
class Post < ApplicationRecord
  has_many :images, :as => :imageable
  belongs_to :user
  scope :published, -> { where.not(published_at: nil) }

  def published
    update_attribute(:published_at, DateTime.now)
  end

  def unpublished
    update_attribute(:published_at, nil)
  end
end
