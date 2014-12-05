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
      if @user.present?
        @bookmarked = Bookmark.find_by_user_id_and_design_id(@user.id,@design.id).present?
      end
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
    
    cur_design.filepath = '/designs/' + cur_design.id.to_s + '.stl'
    cur_design.imagefilepath = '/designs/' + cur_design.id.to_s + '.jpg'
    
    # Make folder for user if it doesn't exist
    dir = File.dirname('/designs/')
    unless File.directory?(dir)
      FileUtils.mkdir_p(dir)
    end
    
    stl_saved_file = File.new(Rails.public_path.to_s + cur_design.filepath,"w")
    stl_saved_file.write(params[:stl_file].read.force_encoding("UTF-8"))
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
    added = false
    query_string = ""
    conditions = {}
    if params[:title].present?
      conditions[:title] = '%' + params[:title] + '%'
      query_string = "title LIKE :title"
      added = true
    end
    
    if params[:date].present?
      conditions[:created_at] = params[:date]
      query_string += " AND " if added
      query_string += "created_at LIKE :created_at"
    end
    
    @designs = Design.where(query_string, conditions).to_a
    
    if params[:author].present?
      @designs.keep_if do |design|
        (design.user.username =~ Regexp.new(params[:author])).present?
      end
    end
    
    render 'index'
  end
  # Design View All page
  def index
    @page_size = 5
    if params[:offset].present? and params[:offset].to_i > 0
      @current_offset = params[:offset].to_i
      @designs = Design.order('created_at ASC').offset(@current_offset)
    else
      @designs = Design.first(@page_size)
      @current_offset = 0
    end
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
  # Bookmark File
  def try_bookmark
    if !@user.present?
      cookies[:error] = "You must be logged in to do that"
      redirect_to(login_path) and return
    end
    d_id = params[:design_id];
    
    bookmark = Bookmark.new({
                              :user_id => @user.id,
                              :design_id => d_id
                           })
    if Design.find(d_id).nil?
      cookies[:error] = "That design doesn't exist"  
    elsif Bookmark.find_by_user_id_and_design_id(@user.id,d_id).nil?
      bookmark.save
      cookies[:success] = "Files successfully uploaded"  
      redirect_to design_path(d_id) and return
    end
    redirect_to d_view_all_path
  end
end
