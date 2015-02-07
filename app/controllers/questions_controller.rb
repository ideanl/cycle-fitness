class QuestionsController < ApplicationController
  include Editable

  def index
    @questions = Question.all
  end
end
