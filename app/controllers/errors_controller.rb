class ErrorsController < ApplicationController
  
  layout 'welcome'
  
  def not_found
    respond_to do |format|
      format.html { render status: 404 }
    end
  rescue ActionController::UnknownFormat
    render status: 404, text: "Not Found"
  end
end