class HomeController < ApplicationController
  skip_before_filter :require_login
  # Home Page index action
  def index
    # Get a list of images in slideshow directory
    image_dir = "#{Rails.root}/app/assets/images/slideshow"
    @image_paths = ''
    Dir.chdir(image_dir) do
      @image_paths = Dir['*']
    end
    @image_divs = ''
    @image_paths.each_with_index do | path, index |
      @image_divs << "<div class='slideshow-img' id='image#{index}' style='background: url(#{ActionController::Base.helpers.asset_path(path)})'></div>"
    end
  end
end
