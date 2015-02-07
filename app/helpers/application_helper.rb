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
        if !admin.blank? && current_user && current_user.logged_in?
          button = "<a href='/#{params[:controller]}/new' style='margin-left: 10px;' class='btn btn-success btn-sm'>#{admin}</a>"
        end
        "<h1 class='text-center'>#{title}#{button}</h1>".html_safe
      end
    end
    title
  end
end
