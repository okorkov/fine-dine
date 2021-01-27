class Guest < ApplicationRecord
  has_many :reservations
  has_many :restaurants, through: :reservations

  has_secure_password

  validates :email, :first_name, :last_name, :phone_number, presence: true
  validates :email, uniqueness: true


end

