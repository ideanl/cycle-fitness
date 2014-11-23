module ApplicationHelper
  #Returns the page title for the page <title> tag and the header within the container
  def page_title
    title = I18n.t("views.#{params[:controller]}.#{params[:action]}.title", default: params[:controller].capitalize)
    content_for :page_title do
      "<h1 class='text-center'>#{title}</h1>".html_safe
    end
    title
  end
end
