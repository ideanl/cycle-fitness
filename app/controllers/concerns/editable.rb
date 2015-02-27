module Editable
  extend ActiveSupport::Concern

  public
    def new
      instance_variable_set("@#{model_name}", model_class.new)
    end

    def create
      instance_variable_set("@#{model_name}", model_class.new(self.send("#{model_name}_params")))
      
      if model_instance.save
        redirect_success
      else
        flash_errors
        render 'new'
      end
    end

    def edit

    end

    def update
      if model_instance.update_attributes(self.send("#{model_name}_params"))
        respond_to do | format |
          format.html { redirect_success }
          format.json { render json: {message: 'success'} }
        end
      else
        flash_errors
        render 'edit'
      end
      
    end

    def destroy
      if model_class.find(params[:id]).destroy
        respond_to do | format |
          format.html{ redirect_success }
          format.json { render json: {message: 'success'} }
        end
      else
        flash_errors
      end
    end

  private
    def model_name
      controller_name.singularize
    end

    def model_class
      model_name.classify.constantize
    end

    def redirect_success
      msg = "Successfully #{params[:action] == 'create' ? 'created new' : 'updated'} #{model_name}."
      if self.respond_to?(:show)
        redirect_to url_for(action: 'show', controller: model_name.pluralize, id: model_instance.to_param), success: msg
      else
        redirect_index msg
      end
    end

    def load_model
      instance_variable_set("@#{model_name}", model_class.find(params[:id]))
      unless model_instance
        raise ActiveRecord::RecordNotFound
      end
    end

    def model_instance
      instance_variable_get("@#{model_name}")
    end

    def redirect_index(message = nil)
      url = 
        if self.respond_to?(:admin)
          url_for(action: 'admin', controller: model_name.pluralize)
        elsif self.respond_to?(:index)
          url_for(action: 'index', controller: model_name.pluralize)
        else
          :back
        end
      redirect_to url, success: message
    end

    def model_instance
      instance_variable_get("@#{model_name}")
    end

    def flash_errors
      errors = model_instance.errors.full_messages
      flash.now[:danger] = "Could not #{model_instance.new_record? ? 'create' : 'update'} #{model_name}. Error#{'s' unless errors.length == 1}: #{errors.join('. ')}"
    end

  included do
    before_action :load_model, only: [:edit, :update, :destroy]
    before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]
  end
end
