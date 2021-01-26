class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :guest
  has_one :slot
end
