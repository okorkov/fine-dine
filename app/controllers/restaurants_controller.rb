class RestaurantsController < ApplicationController

  layout 'welcome'

  def index

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    raise @restaurant.inspect
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :email, :password, :password_confirmation, :opening_time, :closing_time, :phone_number, :address, :picture, :capacity, :city)
  end

end

