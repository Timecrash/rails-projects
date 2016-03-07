module SessionsHelper
  def log_in(user)
    remember_token = User.new_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_digest, User.digest(remember_token))
    self.current_user = user #Have to set it to this Rails 'instance,' can't just call it on its own.
  end
  
  def log_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  def current_user
    current_digest = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_digest: current_digest)
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def logged_in?
    !current_user.nil?
  end
end
