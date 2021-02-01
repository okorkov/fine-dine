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
        guest_session
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
    @guest = Guest.find_or_create_by(email: auth['email'], first_name: auth['first_name']) do |guest|
      guest.password = SecureRandom.hex(10)
      guest.save
    end
    if @guest && @guest.id
      guest_session
    else
      redirect_to new_session_path
    end
  end

  private 

  def auth
    request.env['omniauth.auth']['info']
  end

end