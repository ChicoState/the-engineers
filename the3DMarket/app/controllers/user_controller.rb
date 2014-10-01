require 'PasswordHash'

class UserController < ApplicationController
  include PasswordHash
  #protect_from_forgery with: :exception
  
  # User Show page
  def show
  end
  # User Sign Up page
  def create
  end
  # User Settings page
  def index
  end
  # User login page
  def login
  end
  # Tries to log the user in with the supplied credentials
  def try_login
    @user = User.find_by_username(params[:username])
    if @user.present?
      @user.last_log = Time.now
      @user.save
      if PasswordHash.validatePassword(params[:password],@user.hash_pass)
        #Login cookie expires after an hour.
        cookies[:user] = {:value => @user.id.to_s, :expires => Time.now + 3600}
      else
        cookies[:error] = "A user with that password was not found"
      end
    else
      cookies[:error] = "A user with that password was not found"
    end
    redirect_to(login_path)
  end
  # Logs out any user and deletes any session data and cookies.
  def logout
    @user = nil
    cookies[:user] = nil
    redirect_to(login_path)
  end
end
