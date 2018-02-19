class Review < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  validates :rating, inclusion: [1,2,3,4,5]
  validates :comment, length: {in: 100..2000, too_short:"100 characters is the minimum required", too_long: "2000 characters is the maximum allowed"}
end
