class GuestsController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
 

  layout 'restaurant_guest'
  
  def new
    @guest = Guest.new
    render layout: 'welcome'
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.valid?
      @guest.save
      session[:guest_id] = @guest.id
      redirect_to restaurants_path
    else
      render :new, layout: 'welcome'
    end
  end

  def edit
    @guest = current_guest
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update(guest_params)
      redirect_to restaurants_path
    else
      render :edit
    end
  end

  def destroy
    current_guest.destroy
    session[:guest_id] = nil
    redirect_to root_path
  end

  private

  def guest_params
    params.require(:guest).permit(:email, :password, :password_confirmation, :phone_number, :first_name, :last_name)
  end

end
