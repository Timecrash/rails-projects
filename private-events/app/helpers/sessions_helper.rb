module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end
  
  def log_out
    self.current_user = nil
    session.delete(:user_id)
  end
  
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find(user_id)
    end
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def logged_in?
    !current_user.nil?
  end
end
