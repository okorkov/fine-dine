class SlotsController < ApplicationController

  layout 'restaurant_guest'

  before_action :require_login, :find_slot_and_restaurant
  skip_before_action :find_slot_and_restaurant, only: [:new, :create]

  def index
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
    redirect_rest_slot
  end

  def show
    @reservation = Reservation.new
  end

  def edit
  end

  def update
    slot.update(slot_params)
    redirect_rest_slot
  end

  def destroy
    @slot.destroy
    redirect_rest_slot
  end

  private

  def slot_params
    params.require(:slot).permit(:restaurant_id, :time, :party_size, :date)
  end

end