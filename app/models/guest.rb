class Guest < ApplicationRecord
  has_many :reservations
  has_many :restaurants, through: :reservations

  has_secure_password

  validates :email, :first_name, :last_name, :phone_number, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :phone_number, length: { is: 10 }


end

