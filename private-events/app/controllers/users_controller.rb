class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to the app, #{@user.name}!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events  = @user.events
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end
  
  private
  def user_params
    params.require(:user).permit(:name)
  end
end
