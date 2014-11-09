require 'fileutils'

class DesignController < ApplicationController
  # Design View page
  def browse
    if params[:id].nil? # Handle 
      redirect_to d_view_all_path
    else
      @design = Design.find(params[:id])
    end
  end
  def show
    if params[:id].nil? # Handle 
      redirect_to d_view_all_path
    else
      @design = Design.find(params[:id])
    end
  end
  # Design Upload page
  def create
    # Make sure user is logged in first
    if !@user.present?
      cookies[:error] = "You must be logged in to do that"
      redirect_to(login_path) and return
    end
  end
  # Validate and upload the file
  def try_create
    if !@user.present?
      cookies[:error] = "You must be logged in to do that"
      redirect_to(login_path) and return
    end
    
    cur_design = Design.create({
                  title: params[:title],
                  sdesc: params[:sdesc],
                  user_id: @user.id,
                  license_id: 1})
    
    cur_design.filepath = '/designs/' + @user.id.to_s + "/" + cur_design.id.to_s + '.stl'
    cur_design.imagefilepath = '/designs/' + @user.id.to_s + "/" + cur_design.id.to_s + '.jpg'
    
    # Make folder for user if it doesn't exist
    dir = File.dirname('/designs/' + @user.id.to_s + '/')
    unless File.directory?(dir)
      FileUtils.mkdir_p(dir)
    end
    
    stl_saved_file = File.new(Rails.public_path.to_s + cur_design.filepath,"w")
    stl_saved_file.write(params[:stl_file].read)
    # Fix Permissions
    stl_saved_file.chmod(0666)
    stl_saved_file.close
    img_saved_file = File.open(Rails.public_path.to_s + cur_design.imagefilepath,"wb"){ |f|
                        f.write(params[:image_file].read)
                        f.chmod(0666)
                     }
    cur_design.save
    cookies[:success] = "Files successfully uploaded"
    
    redirect_to d_view_all_path and return
  end
  def upload
    if params[:id].nil? # Handle 
      redirect_to d_create_path
    else
      @design = Design.find(params[:id])
    end
  end
  # Design Search page
  def search
  end
  # Design View All page
  def index
    @designs = Design.first(10)
  end
  def about
    if params[:id].nil? # Handle 
      redirect_to about_path
    else
      @design = Design.find(params[:id])
    end
  end
  def contact
    if params[:id].nil? # Handle 
      redirect_to contact_path
    else
      @design = Design.find(params[:id])
    end
  end
  def legal
    if params[:id].nil? # Handle 
      redirect_to legal_path
    else
      @design = Design.find(params[:id])
    end
  end
end
