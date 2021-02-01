class CitiesController < ApplicationController

  before_action :require_login

  layout 'restaurant_guest'

  def index
    @cities = City.all
  end

end