class ApplicationController < ActionController::Base
  
  add_flash_types :danger,:success
  
  private

  def logged_in?
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :logged_in?
end
