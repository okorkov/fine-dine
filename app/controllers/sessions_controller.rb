class SessionsController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create, :google]

  layout 'welcome'

  def new
    redirect_to restaurants_path if logged_in?
  end

  def create
    @guest = Guest.find_by(email: params[:email])
    if @guest.nil?
      @error = "No user with this email found"
      render :new
    else
      if @guest && @guest.authenticate(params[:password])
      session[:guest_id] = @guest.id
      session[:restaurant_id] = nil
      redirect_to restaurants_path
      else
        @error = "Invalid password"
        render :new
      end
    end
  end

  def destroy
    session[:guest_id] = nil
    redirect_to root_path
  end

  def google
    @guest = Guest.find_or_create_by(email: auth['info']['email']) do |guest|
      guest.first_name = auth['info']['first_name']
      guest.password = SecureRandom.hex(10)
      guest.save
    end
    if @guest && @guest.id
      session[:guest_id] = @guest.id
      redirect_to restaurants_path
    else
      redirect_to new_session_path
    end
  end

  private 

  def auth
    request.env['omniauth.auth']
  end

end