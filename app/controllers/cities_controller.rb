class CitiesController < ApplicationController

  before_action :require_login

  layout 'guest'

  def index
    @cities = City.all
  end

end