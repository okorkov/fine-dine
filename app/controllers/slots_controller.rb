class SlotsController < ApplicationController

  layout 'restaurant'

  before_action :require_login

  def index

  end

  def new

  end

  def create

  end

  def show

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