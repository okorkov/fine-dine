class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :guest
  belongs_to :slot

  validates :guest_id, :date, :restaurant_id, presence: true

end
