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

    title = I18n.t("views.#{params[:controller]}.#{action}.title", default: params[:controller].capitalize)

    if !content_for :page_title
      content_for :page_title do
        "<h1 class='text-center'>#{title}</h1>".html_safe
      end
    end
    title
  end
end
