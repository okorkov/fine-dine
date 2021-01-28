class ApplicationController < ActionController::Base

  helper_method :current_restaurant, :logged_in?

  def current_restaurant
    Restaurant.find_by(id: session[:restaurant_id])
  end

  def logged_in?
    session[:restaurant_id] != nil
  end

end
