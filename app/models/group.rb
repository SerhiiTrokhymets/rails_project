# frozen_string_literal: true
class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships, dependent: :destroy
  has_many :images, as: :imageable

  enum status: [:active, :archived, :removed, :permanently_removed], _default: 'active'

  validates :name, :group_type, :status, presence: true
  validates :name, uniqueness: true
end
