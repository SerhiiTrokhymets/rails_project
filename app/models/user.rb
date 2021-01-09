# frozen_string_literal: true

class User < ApplicationRecord
  has_many :images, as: :imageable
  has_many :posts
  validates :email, uniqueness: true
  validates :user_name, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :user_name, :password, :email, presence: true
  scope :adults, -> { where('birthday >= ?', 18.years.from_now) }

  def full_name
    puts "#{last_name}  #{first_name[0]}"
  end
end
