module ApplicationHelper

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

  def guest_session
    session[:guest_id] = @guest.id
    session[:restaurant_id] = nil
    redirect_to restaurants_path
  end

  def restaurant_session_reset
    session[:restaurant_id] = nil
    redirect_to root_path
  end

  def redirect_rest_slot
    redirect_to restaurant_slots_path(current_restaurant)
  end

end
