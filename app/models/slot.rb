class Slot < ApplicationRecord
  belongs_to :restaurant
  has_one :reservation

  validates :party_size, :time, :date, :restaurant_id, presence: true
end
