class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      # flash[:success] = "Welcome to the school management application"
      flash[:success] = "Thank you for signing up!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def allowed_params
    params.require(:user).permit(:email, :password)
  end
end