class ApplicationController < ActionController::Base
  before_filter :handle_cookies
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def handle_cookies
    @user_login_path = "/try_login"#login_path
    if cookies[:user].present?
      @user = User.find(cookies[:user])
      @user_login_path = logout_path  
    end
    @user_login_path[0] = '' # Remove / from path
  end
  
end
