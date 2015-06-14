module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  # use find_by instead of find
  # -> User.find(nil) will crash the app!
  def current_user
    @current_user ||= User.find_by(id:session[:user_id])
  end

  def logged_in?
    if current_user == nil
      redirect_to "/login"
    end
  end

  def logout
    @current_user = session[:user_id] = nil
  end

end
