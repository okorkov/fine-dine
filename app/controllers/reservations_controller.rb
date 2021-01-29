class ReservationsController < ApplicationController
  
  layout 'restaurant'

  before_action :require_login

  def new
    @reservation = Reservation.new
  end

  def create
    raise params.inspect
    reservation = Reservation.create(reservation_params)
    slot = Slot.find(params[:slot_id])
    
    # create_table "slots", force: :cascade do |t|
    #   t.integer "party_size"
    #   t.string "time"
    #   t.boolean "booked", default: false
    #   t.integer "reservation_id"
    #   t.integer "restaurant_id"
    #   t.datetime "created_at", precision: 6, null: false
    #   t.datetime "updated_at", precision: 6, null: false
    #   t.string "date"
 
    
    # create_table "reservations", force: :cascade do |t|
    #   t.integer "guest_id"
    #   t.integer "restaurant_id"
    #   t.datetime "date"
    #   t.datetime "created_at", precision: 6, null: false
    #   t.datetime "updated_at", precision: 6, null: false

  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    raise params.inspect
  end

  private

  def require_login
    render 'layouts/access_denied', :layout => false if session[:guest_id].nil? && session[:restaurant_id].nil? 
  end

  def reservation_params
    params.require(:reservation).permit(:guest_id, :restaurant_id)
  end
end