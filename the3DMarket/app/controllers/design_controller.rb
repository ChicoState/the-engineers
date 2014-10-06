require 'pp'

class DesignController < ApplicationController
  # Design View page
  def show
    if params[:id].nil? # Handle 
      redirect_to d_view_all_path
    else
      @design = Design.find(params[:id])
    end
  end
  # Design Upload page
  def create
  end
  # Design Search page
  def search
  end
  # Design View All page
  def index
  end
end
