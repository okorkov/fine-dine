class RestaurantsController < ApplicationController

  before_action :require_login, :find_restaurant, only: [:show, :edit, :update]
  skip_before_action :require_login, only: [:new, :create]

  layout 'restaurant_guest'

  def index
    if params[:city_id]
      @restaurants = City.find(params[:city_id]).restaurants
    else
      @restaurants = Restaurant.order(Arel.sql('RANDOM()')).first(20)
    end
    
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.city = City.new
    render layout: 'welcome'
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.valid?
      @restaurant.save
      session[:restaurant_id] = @restaurant.id
      session[:guest_id] = nil
      redirect_to restaurant_path(@restaurant)
    else
      render :new, layout: 'welcome'
    end
  end

  def show
    @review = Review.new
    if @restaurant.nil?
      redirect_to restaurants_path
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    current_restaurant.destroy
    restaurant_session_reset
  end

  def search  
    if !params[:search].blank?  
      @parameter = params[:search].downcase  
      @results = Restaurant.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end  
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name.downcase, :email.downcase, :password, :password_confirmation, :opening_time, :closing_time, :phone_number, :address, :picture, :capacity, city_attributes: [:name.downcase, :id])
  end


end

