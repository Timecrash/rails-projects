class StaticPagesController < ApplicationController
  def index
    @user_id     = params[:user_id]     || "15261150@N08"
    @photo_count = params[:photo_count] || 12
    @user        = flickr.people.getInfo(user_id: @user_id)
  end
end
