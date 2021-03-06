class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      flash[:success] = "Welcome to the Treehouse, #{@user.name}!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    flash[:success] = "You have logged out successfully."
    redirect_to root_path
  end
end
