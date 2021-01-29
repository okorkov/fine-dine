class GuestsController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
 

  layout 'guest'
  
  def show

  end

  def new
    @guest = Guest.new
    render layout: 'welcome'
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.valid?
      @guest.save
      session[:guest_id] = @guest.id
      redirect_to guest_path(@guest)
    else
      render :new, layout: 'welcome'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def require_login
    render 'layouts/access_denied', :layout => false unless session.include? :guest_id
  end

  def guest_params
    params.require(:guest).permit(:email, :password, :password_confirmation, :phone_number, :first_name, :last_name)
  end

end
