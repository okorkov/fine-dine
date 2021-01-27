class ApplicationController < ActionController::Base

  helper_method :current_restaurant

  def current_restaurant
    Restaurant.find_by(id: session[:restaurant_id])
  end

end
