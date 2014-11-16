class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :danger, :success, :warning

  # Displays flash error for failed object saves
  def flash_errors(object)
    errors = object.errors.full_messages
    flash.now[:danger] = "Could not #{object.new_record? ? 'create' : 'update'} #{controller_name.singularize}. Error#{'s' unless errors.length == 1}: #{errors.join('. ')}."
  end
end
