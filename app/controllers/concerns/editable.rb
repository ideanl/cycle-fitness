module Editable
  extend ActiveSupport::Concern

  public
    def new

    end

    def create

    end

  included do
    before_filter :require_login, only: [:new, :create]
  end
end
