class Slot < ApplicationRecord
  belongs_to :restaurant
  belongs_to :reservation

  validates :party_size, :time, :date, :booked, :reservation_id, :restaurant_id, presence: true
end
