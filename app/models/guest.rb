class Guest < ApplicationRecord
  has_many :reservations
  has_many :restaurants, through: :reservations

  has_secure_password
  
end
