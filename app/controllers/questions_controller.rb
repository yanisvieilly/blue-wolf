class QuestionsController < ApplicationController
  def index
    @question = Question.new
  end

  def create
  end
end
