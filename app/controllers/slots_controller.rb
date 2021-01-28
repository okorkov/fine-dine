class SlotsController < ApplicationController

  layout 'restaurant'

  before_action :require_login

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @slots = Slot.all
  end

  def new
    @slot = Slot.new
  end

  def create
    slot = Slot.create(slot_params)
    redirect_to restaurant_slots_path(current_restaurant)
  end

  def show
    @slot = Slot.find(params[:id])
  end

  def edit

  end

  def update

  end

  private

  def require_login
    render 'access_denied', :layout => false unless session.include? :restaurant_id
  end

  def slot_params
    params.require(:slot).permit(:restaurant_id, :time, :party_size, :date)
  end

end