class Restaurant < ApplicationRecord
  has_many :slots
  belongs_to :city
  has_many :reservations
  has_many :users, through: :reservations

  has_secure_password
end
