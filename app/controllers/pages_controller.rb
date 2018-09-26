class PagesController < ApplicationController
  
  def home
    redirect_to admissions_path if logged_in?
  end
  
end