class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :guest

  def self.most_reviews
    Restaurant.all.max_by {|rest| rest.reviews.size}
  end
  
end
