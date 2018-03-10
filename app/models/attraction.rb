class Attraction < ApplicationRecord
  belongs_to :destination
  belongs_to :category
  has_many :reviews
  has_many :wishes
  has_many :users, through: :wishes
  validates :name, presence: true
  validates :image_url, presence: true
  validates :address, presence: true
end
