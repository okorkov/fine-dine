class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :guest
  has_one :slot

  validates :guest_id, :date, :restaurant_id, presence: true

end
