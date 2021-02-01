class SlotsController < ApplicationController

  layout 'restaurant'

  before_action :require_login

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @slots = @restaurant.slots
  end

  def new
    @slot = Slot.new
  end

  def create
    counter = 1
    while counter <= params[:how_many].to_i
      slot = Slot.create(slot_params)
      counter += 1
    end
    redirect_to restaurant_slots_path(current_restaurant)
  end

  def show
    @slot = Slot.find(params[:id])
    @restaurant = Restaurant.find_by(params[:restaurant_id])
    @reservation = Reservation.new
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @slot = Slot.find(params[:id])
  end

  def update
    slot = Slot.find(params[:id])
    slot.update(slot_params)
    redirect_to restaurant_slots_path(current_restaurant)
  end

  def destroy
    Slot.find(params[:id]).destroy
    redirect_to restaurant_slots_path(current_restaurant)
  end

  private

  def slot_params
    params.require(:slot).permit(:restaurant_id, :time, :party_size, :date)
  end

end