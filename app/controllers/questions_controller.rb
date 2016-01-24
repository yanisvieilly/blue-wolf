class QuestionsController < ApplicationController
  def index
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      render json: @question, status: :created
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end
end
