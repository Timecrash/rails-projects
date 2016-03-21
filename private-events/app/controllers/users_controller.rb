class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:name])
    if @user.save
      flash[:success] = "Welcome to the app, #{@user.name}!"
      redirect_to root_path
    else
      render 'new'
  end

  def show
    @user = User.find(params[:id])
  end
end
