# frozen_string_literal: true
class Post < ApplicationRecord
  has_many :images, :as => :imageable
  belongs_to :user
end
