class SessionsController < ApplicationController

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

end