class GuestsController < ApplicationController

  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]
 

  # layout 'guest'
  
  def show

  end

  def new

  end

  def create
    
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

end