class RestaurantsController < ApplicationController

  layout 'restaurant'

  def index
   render layout: 'welcome'
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.city = City.new
    render layout: 'welcome'
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      session[:restaurant_id] = @restaurant.id
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :email, :password, :password_confirmation, :opening_time, :closing_time, :phone_number, :address, :picture, :capacity, city_attributes: [:name, :id])
  end

end

