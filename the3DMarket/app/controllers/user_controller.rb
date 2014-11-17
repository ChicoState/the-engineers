require 'PasswordHash'

class UserController < ApplicationController
  include PasswordHash
  #protect_from_forgery with: :exception
  def browse
    redirect_to(d_view_all_path) and return
  end
  # User Show page
  def show
	  @user = User.find(params[:id])
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
      redirect_to(user_path(@user.id))
    else
      cookies[:error] = "There was an error, please resubmit the form."
      redirect_to(u_create_path)
    end
  end
  # User upload page
  def upload
    redirect_to(d_create_path) and return
  end
  # User Settings page
  def index
	  if !@user.present?
      cookies[:error] = "You must be logged in to do that"
      redirect_to(login_path) and return
    end
  end
  def try_index
    if !@user.present?
      cookies[:error] = "You must be logged in to do that"
      redirect_to(login_path) and return
    end
    
	  if params[:email].present? == false
		  cookies[:error] = "Email cannot be blank"
		  redirect_to(index_path(@user))and return
	  end
	  if User.find_by_email(params[:email]).present?
		  cookies[:error] = "That email has already been linked to an account"
		  redirect_to(index_path(@user))and return
	  end
	  if params[:password] != params[:conf_password]
		  cookies[:error] = "Your passwords don't match"
		  redirect_to(index_path(@user))and return
	  end
	  if params[:password].length < 4
		  cookies[:error] = "That password is too short"
		  redirect_to(index_path(@user))and return	
	  end

	  @user.email = params[:email]
	  @user.hash_pass = PasswordHash.createHash(params[:password])
	  @user.save()
	  redirect_to(user_path(@user))
  end
  # User login page
  def login
  end
  # Tries to log the user in with the supplied credentials
  def try_login
    @user = User.find_by_username(params[:username])
    if @user.present?
      if PasswordHash.validatePassword(params[:password],@user.hash_pass)
        #Login cookie expires after an hour.
        @user.last_log = Time.now
        @user.save
        cookies[:user] = {:value => @user.id.to_s, :expires => Time.now + 3600}
        redirect_to(user_path(@user.id)) and return
      else
        cookies[:error] = "The username or password specified was incorrect."
      end
    else
      cookies[:error] = "The username or password specified was incorrect."
    end
    @user = nil
    redirect_to(login_path)
  end

  def try_index
    @user = User.find(params[:id])

    if params[:email].present? == false
      cookies[:error] = "Email cannot be blank"
      redirect_to(index_path(@user))and return
    end
    if User.find_by_email(params[:email]).present?
      cookies[:error] = "That email has already been linked to an account"
      redirect_to(index_path(@user))and return
    end
    if params[:password] != params[:conf_password]
      cookies[:error] = "Your passwords don't match"
      redirect_to(index_path(@user))and return
    end
    if params[:password].length < 4
      cookies[:error] = "That password is too short"
      redirect_to(index_path(@user))and return  
    end

    @user.email = params[:email]
    @user.hash_pass = PasswordHash.createHash(params[:password])
    @user.save()
    redirect_to(user_path(@user))
  end

  # Show current user's library
  def library
    @bookmarks = @user.bookmarks
  end

  # Logs out any user and deletes any session data and cookies.
  def logout
    @user = nil
    cookies[:user] = nil
    redirect_to(login_path)
  end
  def about
    redirect_to(about_path) and return
  end
  def contact
    redirect_to(contact_path) and return
  end
  def legal
    redirect_to(legal_path) and return
  end
end
