require 'PasswordHash'

class LoginController < ApplicationController
  include PasswordHash
  protect_from_forgery with: :exception
  
  def login
  end
  def try_login
    @user = User.find_by_username(params[:username])
    if @user.present?
      @user.hash_pass = PasswordHash.createHash(params[:password])
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
  def logout
    @user = nil
    reset_session
    cookies[:user] = nil
    redirect_to(login_path)
  end
end

