class ApplicationController < ActionController::Base

  helper_method :current_restaurant, :logged_in?, :current_guest, :restaurant_logged_in?, :require_login

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

  def require_login
    render 'errors/not_logged_in', :layout => "welcome" if session[:guest_id].nil? && session[:restaurant_id].nil? 
  end

end
