class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      flash[:danger] = "Something went wrong!"
      render 'new'
    end
  end
  
  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end
  
  def post_params
    params.require(:post).permit(:text)
  end
end
