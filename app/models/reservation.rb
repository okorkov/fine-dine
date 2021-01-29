class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :guest
  belongs_to :slot

  validates :guest_id, :restaurant_id, presence: true

end
