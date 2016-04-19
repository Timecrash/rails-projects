class StaticPagesController < ApplicationController
  def index
    @user_id     = params[:user_id]     || "15261150@N08"
    @photo_count = params[:photo_count] || 12
  end
end
