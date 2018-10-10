class SearchController < ApplicationController

  def index
  end
  # Render the app/views/search/index.html.erb
  # Which is a search form that will POST to the
  # results action.

  def results
   if current_user.admin?
      @students = Student.all.search(params[:search])
   else
     @students = current_user.students.search(params[:search]) 
   end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  # After searching using ActiveRecord will display
  # the search results in the app/views/search/results.html.erb
end