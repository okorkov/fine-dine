class ReservationsController < ApplicationController

  before_action :require_login
  
  layout 'restaurant'

  def index
    if current_restaurant
      render :restaurant_index
    end
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
    if params[:completed]
      res.slot.destroy
      res.destroy
      redirect_to restaurant_reservations_path(current_restaurant)
    else
      res.slot.booked = false
      res.slot.save
      res.destroy
      redirect_to guest_reservations_path(current_guest)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:guest_id, :restaurant_id, :slot_id)
  end
end