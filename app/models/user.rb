class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :wishes
  has_many :attractions, through: :wishes
  validates :username, presence: true,
                       format: { with: /[A-Za-z0-9]+/ },
                       length: { minimum: 5 },
                       uniqueness: true
  validates :email, presence: true,
                    email_format: { message: "doesn't look like an email address" },
                    confirmation: { case_sensitive: false },
                    uniqueness: true
  validates :email_confirmation, presence: true
  validates :password, presence: true,
                       length: { minimum: 8 },
                       confirmation: true
  validates :password_confirmation, presence: true
end
