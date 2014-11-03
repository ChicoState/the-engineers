require 'PasswordHash'

class UserController < ApplicationController
  include PasswordHash
  #protect_from_forgery with: :exception
  
  # User Show page
  def show
    if !@user.present?
      redirect_to(login_path) and return
    else
      @view_user = User.find(params[:id])
      @designs = Design.where(:user_id => params[:id])
    end
  end
  # User Sign Up page
  def create
  end
  def try_create
    if params[:username].present?
      if User.find_by_username(params[:username]).present?
        cookies[:error] = "That username is taken"
        redirect_to(u_create_path) and return
      end
      if User.find_by_email(params[:email]).present?
        cookies[:error] = "That email has already been linked to an account"
        redirect_to(u_create_path) and return
      end
      if params[:password] != params[:conf_password]
        cookies[:error] = "Your passwords don't match"
        redirect_to(u_create_path) and return
      end
      if params[:password].length < 4
        cookies[:error] = "That password is too short"
        redirect_to(u_create_path) and return
      end
      
      @user = User.new()
      @user.username = params[:username]
      @user.email = params[:email]
      @user.hash_pass = PasswordHash.createHash(params[:password])
      @user.last_log = Time.now
      @user.save()

      #Login cookie expires after an hour.
      cookies[:user] = {:value => @user.id.to_s, :expires => Time.now + 3600}
      
      #Fix This
      redirect_to(login_path)
    else
      cookies[:error] = "There was an error submitting, try again"
      redirect_to(u_create_path)
    end
  end
  # User Settings page
  def index
    #@design = Design.find(params[:id])
    @design = Design.find(37)
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
    @user = nil
    redirect_to(login_path)
  end
  # Logs out any user and deletes any session data and cookies.
  def logout
    @user = nil
    cookies[:user] = nil
    redirect_to(login_path)
  end
end
