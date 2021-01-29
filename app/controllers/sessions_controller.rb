class SessionsController < ApplicationController

  layout 'welcome'

  def new
    redirect_to guest_path(current_guest) if logged_in?
  end

  def create
    @guest = Guest.find_by(email: params[:email])
    if @guest.nil?
      @error = "No user with this email found"
      render :new
    else
      if @guest && @guest.authenticate(params[:password])
      session[:restaurant_id] = @guest.id
      redirect_to guest_path(@guest)
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