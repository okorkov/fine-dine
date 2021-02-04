class GuestsController < ApplicationController

  before_action :require_login, :guest_declaration
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :guest_declaration, only: [:new, :create, :destroy]

  layout 'restaurant_guest'
  
  def new
    @guest = Guest.new
    render layout: 'welcome'
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.valid?
      @guest.save
      guest_session
    else
      render :new, layout: 'welcome'
    end
  end

  def edit
  end

  def update
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
    params.require(:guest).permit(:email.downcase, :password, :password_confirmation, :phone_number, :first_name.downcase, :last_name.downcase)
  end

end
