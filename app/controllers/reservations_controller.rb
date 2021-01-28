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
    render 'access_denied', :layout => false unless session.include? :restaurant_id
  end
end