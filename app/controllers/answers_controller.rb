class AnswersController < ApplicationController
  before_action :check_answers, only: :create

  def index
  end

  def create
    params['answers'].each do |question_id, answer|
      question = Question.find(question_id)
      answer = Answer.new(answer_params(answer))
      if answer.save
        question.answers << answer
      else
        render(json: answer.errors, status: :unprocessable_entity) && return
      end
    end

    render json: true, status: :created
  end

  private

  def answer_params(answer)
    answer.permit(:value)
  end

  def check_answers
    unless params['answers']
      render json: { value: ['none of the questions were answered'] },
             status: :unprocessable_entity
    end
  end
end
