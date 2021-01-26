# frozen_string_literal: true

class User < ApplicationRecord
  has_many :images, as: :imageable
  has_many :posts, dependent: :destroy
  has_many :memberships
  has_many :groups, through: :memberships

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :email, uniqueness: true, format: { with: VALID_EMAIL }
  validates :password, length: { minimum: 8 }
  validates :password, :email, presence: true
  validates :personal_data, uniqueness: true, presence: true

  scope :adults, -> { where('birthday >= ?', 18.years.from_now) }

  def full_name
    puts "#{last_name}  #{first_name[0]}"
  end

  # def to_csv
  #   [id, first_name, last_name, birthday, password, email]
  # end
end
