class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :danger, :success, :warning

  before_filter :set_locale

  # Displays flash error for failed object saves
  def flash_errors(object)
    errors = object.errors.full_messages
        flash.now[:danger] = "#{I18n.t("helpers.error.#{object.new_record? ? 'create' : 'update'}", controller: controller_name.singularize)} Error#{'s' unless errors.length == 1}: #{errors.join('. ')}."
  end

  def default_url_options(options={})
    { locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    puts I18n.locale
  end

  def require_login
    if !current_user || !current_user.logged_in?
      redirect_to root_url
    end
  end

  private
    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
end
