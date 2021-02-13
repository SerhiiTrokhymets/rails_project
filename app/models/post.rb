# frozen_string_literal: true
class Post < ApplicationRecord
  has_many :images, :as => :imageable
  belongs_to :user
  scope :publish, -> { where.not(published_at: nil) }

  def publish
    update_attribute(:published_at, DateTime.now)
  end

  def unpublish
    update_attribute(:published_at, nil)
  end
end
