module FlickrHelper
  def user_photos(user_id, photo_count)
    flickr.photos.search(user_id: user_id, per_page: photo_count)
  end
  
  def render_flickr(user_id, photo_count)
    photos = user_photos(user_id, photo_count)
    render partial: '/flickr/sidebar_widget', locals: { photos: photos, user_id: user_id }
    rescue Exception
      render partial: '/flickr/unavailable'
  end
end