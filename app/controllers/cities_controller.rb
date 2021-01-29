class CitiesController < ApplicationController

  layout 'guest'

  def index
    @cities = City.all
  end

end