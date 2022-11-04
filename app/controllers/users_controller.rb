class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(form_params)

    # Check if user save
    if @user.save

      # Keep hold of that user
      session[:user_id] = @user.id

      # Let the user knnow they signup
      flash[:success] = "Welcome to Pictons"

      redirect_to root_path
    else
      render "new"
    end
  end

  def form_params
    params.require(:user).permit(:name,:username,:email, :password, :password_confirmation)
  end

end
