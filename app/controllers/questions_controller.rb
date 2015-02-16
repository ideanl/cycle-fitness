class QuestionsController < ApplicationController
  include Editable

  def index
    @questions = Question.all
  end

  private

    def question_params
      params.require(:question).permit(:question, :answer, :image)
    end
end
