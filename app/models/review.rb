class Review < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  validates :rating, inclusion: [1,2,3,4,5]
  validates :comment, length: {maximum: 2000, too_long: "2000 characters is the maximum allowed."}
end
