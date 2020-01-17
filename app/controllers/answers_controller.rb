class AnswersController < ApplicationController
  before_action :find_answer, only: %i[show update]

  def index
    @answers = Answer.all
    render json: @answers
  end

  def show
    @answer = Answer.find_by_id(params[:id])
    render json: @answer
  end

  def create
    #@survey = Survey.find_by_id(params[:id])
    @answer = Answer.new(answer_params)
    if @answer.save
      render json: @answer
    else
      render json: { error: @survey.error.full_messages }
    end
  end

  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: { error: @answer.error.full_messages }
    end
  end

  private

  def answer_params
    params.require(:answer).permit!
  end

  def find_answer
    @answer = Answer.find_by_id(params[:id])
  end

end
