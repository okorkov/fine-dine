module ApplicationHelper

  def set_headers
    response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM https://aokarkau.com"
  end

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
    # cookies["foo"] = {value: "bar", same_site: :none, secure: true}
    # session[:guest_id] = @guest.id
    session[:guest_id] = {value: @guest.id, same_site: :none, secure: true}
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

  def date_format(date)
    date.to_datetime.strftime('%b %e %a')
  end

  def cell_format(number)
    "(#{number[0..2]})#{number[3..5]}-#{number[6..10]}"
  end

  def guest_declaration
    @guest = current_guest
  end

  def book_slot(reservation, value)
    reservation.slot.booked = value
    reservation.slot.save
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

  def find_restaurant
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def authenticate(user)
    user && user.authenticate(params[:password])
  end

  def find_slot_and_restaurant
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @slot = Slot.find_by(id: params[:id])
  end

end
