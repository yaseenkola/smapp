class SessionsController < ApplicationController
  
  def new
  # will simply render the form
  end

 def create
   user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
    session[:user_id] = user.id
    flash[:success] = "You are successfully logged in!"
    redirect_to welcome_path
  else
    flash.now[:danger] = "There was something wrong with your login information"
    render 'new'
  end
 end

  def destroy
   session[:user_id] = nil
   flash[:success] = "You are successfully logged out!"
   redirect_to root_url
  end

end 