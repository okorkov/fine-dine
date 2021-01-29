class Slot < ApplicationRecord
  belongs_to :restaurant
  has_one :reservation, dependent: :destroy

  validates :party_size, :time, :date, :restaurant_id, presence: true
end
