module ApplicationHelper
  #Returns the page title for the page <title> tag and the header within the container
  def page_title
    if params[:action] == 'create'
      action = 'new'
    elsif params[:action] == 'update'
      action = 'edit' 
    else 
      action = params[:action]
    end

    title = I18n.t("views.#{params[:controller]}.actions.#{action}.title", default: params[:controller].capitalize)

    if !content_for :page_title
      content_for :page_title do
        admin = I18n.t("views.#{params[:controller]}.admin", default: "")
        button = ""
        if !admin.blank? && params[:action] == "index" && user_signed_in?
          button = "<a href='/#{params[:controller]}/new' style='margin-left: 10px;' class='btn btn-success btn-sm'>#{admin}</a>"
        end
        "<h1 class='page-title text-center'>#{title}#{button}</h1>".html_safe
      end
    end
    title
  end

  def prep_slideshow
    # Get a list of images in slideshow directory
    image_dir = "#{Rails.root}/app/assets/images/slideshow"
    @image_paths = ''
    Dir.chdir(image_dir) do
      @image_paths = Dir['*']
    end
    @image_divs = ''
    @image_paths.each_with_index do | path, index |
      @image_divs << "<div class='slideshow-img' id='image#{index}' style='background: url(#{asset_path("slideshow/#{path}")});#{"display:none;" if index != 0}'></div>"
    end
  end
end
