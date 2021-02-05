class ReviewsController < ApplicationController

  before_action :require_login

  def create
    review = Review.create(review_params)
    redirect_to restaurant_path(review.restaurant)
  end

  def restraurant_with_most_reviews
    restaurant = Review.most_reviews
    redirect_to restaurant_path(restaurant)
    
  end

  private

  def review_params
    params.require(:review).permit(:content, :guest_id, :restaurant_id)
  end

end