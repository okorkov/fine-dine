class RestaurantsController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:show]

  layout 'restaurant'

  def index
   @restaurants = Restaurant.order(Arel.sql('RANDOM()')).first(10)
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
    @restaurant = Restaurant.find_by(id: params[:id])
    if @restaurant.nil?
      redirect_to restaurants_path
    end
  end


  private

  def require_login
    return head(:forbidden) unless session.include? :restaurant_id
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :email, :password, :password_confirmation, :opening_time, :closing_time, :phone_number, :address, :picture, :capacity, city_attributes: [:name, :id])
  end

end

