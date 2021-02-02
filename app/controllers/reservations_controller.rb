class ReservationsController < ApplicationController

  before_action :require_login, :find_reservation, only: [:show, :destroy]
  
  
  layout 'restaurant_guest'

  def index
    if current_restaurant
      render :restaurant_index
    end
  end

  def create
    reservation = Reservation.create(reservation_params)
    book_slot(reservation, true)
    GuestMailer.welcome_email(reservation).deliver_now
    restaurant = Restaurant.find(params[:reservation][:restaurant_id])
    redirect_to restaurant_reservation_path(restaurant, reservation)
  end

  def show
  end

  def destroy
    if params[:completed]
      @reservation.slot.destroy
      @reservation.destroy
      redirect_to restaurant_reservations_path(current_restaurant)
    else
      book_slot(@reservation, false)
      @reservation.destroy
      redirect_to guest_reservations_path(current_guest)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:guest_id, :restaurant_id, :slot_id, :notes)
  end
end