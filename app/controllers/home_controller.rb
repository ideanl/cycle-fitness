class HomeController < ApplicationController
  skip_before_filter :require_login
  #Home Page index action
  def index
  end
end
