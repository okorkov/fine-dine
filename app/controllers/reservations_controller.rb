class ReservationsController < ApplicationController
  
  layout 'restaurant'

  before_action :require_login

  def index

  end

  def new
    @reservation = Reservation.new
  end

  def create
    reservation = Reservation.create(reservation_params)
    reservation.slot.booked = true
    reservation.slot.save
    restaurant = Restaurant.find(params[:reservation][:restaurant_id])
    redirect_to restaurant_reservation_path(restaurant, reservation)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    res = Reservation.find(params[:id])
    res.slot.booked = false
    res.slot.save
    res.destroy
    redirect_to guest_reservations_path(current_guest)
  end

  private

  def require_login
    render 'layouts/access_denied', :layout => false if session[:guest_id].nil? && session[:restaurant_id].nil? 
  end

  def reservation_params
    params.require(:reservation).permit(:guest_id, :restaurant_id, :slot_id)
  end
end