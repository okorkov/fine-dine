class RestaurantSessionsController < ApplicationController

  layout 'welcome'

  def new
  end

  def create
    @restaurant = Restaurant.find_by(email: params[:email])
    if @restaurant.nil?
      @error = "No restaurant with this email found"
      render :new
    else
      if @restaurant && @restaurant.authenticate(params[:password])
      session[:restaurant_id] = @restaurant.id
      redirect_to restaurant_path(@restaurant)
      else
        @error = "Invalid password"
        render :new
      end
    end
  end

  def destroy
    session[:restaurant_id] = nil
    redirect_to root_path
  end

end