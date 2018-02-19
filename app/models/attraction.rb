class Attraction < ApplicationRecord
  # geocoded_by :address
  # after_validation :geocode
  belongs_to :destination
  belongs_to :type
  has_many :reviews
  has_many :wish_lists
  has_many :users, through: :wish_lists
  validates :name, presence: true
  validates :image_url, presence: true
  validates :address, presence: true
end
