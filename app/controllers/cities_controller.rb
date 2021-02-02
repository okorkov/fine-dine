class CitiesController < ApplicationController

  before_action :require_login

  layout 'restaurant_guest'

  def index
    @cities = City.all
  end

  def most_restaurants
    city = City.all.max_by {|city| city.restaurants.size}
    @cities = [city]
    render :index
  end

end