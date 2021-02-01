class Guest < ApplicationRecord
  has_many :reservations
  has_many :restaurants, through: :reservations
  has_many :reviews

  has_secure_password

  validates :email, :first_name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

end

