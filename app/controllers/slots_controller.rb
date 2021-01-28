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
    raise params.inspect
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

end