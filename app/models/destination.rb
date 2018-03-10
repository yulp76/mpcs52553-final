class Destination < ApplicationRecord
  has_many :attractions
  validates :name, presence: true
  validates :introduction, length: { minimum: 300 }
  validates :cover_url, presence: true
end
