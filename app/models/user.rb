class User < ApplicationRecord
  has_many :reviews
  has_many :wish_lists
  has_many :attractions, through: :wish_lists
  validates :username, presence: true,
                       format: { with: /[A-Za-z0-9]+/ },
                       length: { minimum: 6 },
                       uniqueness: true
  validates :email, presence: true,
                    email_format: { message: "doesn't look like an email address" },
                    confirmation: { message: 'is required' }
  validates :password, presence: true,
                       length: { minimum: 8 },
                       confirmation: { message: 'is required' }
end
