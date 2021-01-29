class ReservationsController < ApplicationController
  
  layout 'restaurant'

  before_action :require_login

  def new
    @reservation = Reservation.new
  end

  def create
    raise params.inspect
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
end