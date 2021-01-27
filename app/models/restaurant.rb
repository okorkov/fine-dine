class Restaurant < ApplicationRecord
  has_many :slots
  belongs_to :city
  has_many :reservations
  has_many :users, through: :reservations

  has_secure_password

  validates :email, :opening_time, :closing_time, :city_id, :phone_number, :address, :picture, :capacity, :name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :phone_number, length: { is: 10 }

  
end
