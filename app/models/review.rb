class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :guest
end
