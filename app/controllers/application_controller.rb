class ApplicationController < ActionController::Base

  helper_method :current_restaurant, :logged_in?, :phone_formatter

  def current_restaurant
    Restaurant.find_by(id: session[:restaurant_id])
  end

  def restaurant_logged_in?
    session[:restaurant_id] != nil
  end

  def current_guest
    Guest.find_by(id: session[:guest_id])
  end

  def logged_in?
    session[:guest_id] != nil
  end

  def phone_formatter
    number = self
    "(#{number[0..2]})#{number[3..5]}-#{number[6..10]}"
  end

end
