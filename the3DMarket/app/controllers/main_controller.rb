class MainController < ApplicationController
  # The Front page
  def index
    @designs = Design.order('created_at DESC').limit(10).to_a
    @main_feature = @designs.last
    @minor_feature = @designs - [@main_feature]
  end
  # The About page
  def about
  end
end
