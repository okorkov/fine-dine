class RestaurantSessionsController < ApplicationController

  layout 'welcome'

  def new

  end

  def create
    @restaurant = Restaurant.find_by(email: params[:email])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:restaurant_id] = @restaurant.id
  end

  def destroy
    raise params.inspect
    session[:restaurant_id] = nil
    session[:guest_id] = nil
  end

end