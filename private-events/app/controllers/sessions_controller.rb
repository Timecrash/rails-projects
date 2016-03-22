class SessionsController < ApplicationController
  def new
  end
  
  def create
    if ( @user = User.find_by(name: params[:session][:name]) )
      log_in(@user)
      flash[:success] = "Welcome back, #{@user.name}!"
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
