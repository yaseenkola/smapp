class SearchController < ApplicationController

  def index
  end
  # Render the app/views/search/index.html.erb
  # Which is a search form that will POST to the
  # results action.

  def results
    @students = Student.where('student_name LIKE ?', "%#{params[:search]}%")
  end
  # After searching using ActiveRecord will display
  # the search results in the app/views/search/results.html.erb
end