class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render json: @questions
  end

  def show
    @question = Question.find_by_id(params[:id])
    render json: @question
  end

  def create
    # New create action to handle data request from JS to database
    @question = Question.new(question_params)
    if @question.save
      render json: @question
    else
      render json: { error: @question.error.full_messages }
    end
  end

  def update
    if @question.update(question_params)
      render json: @question
    else
      render json: { error: @question.error.full_messages }
    end
  end

  def destroy
    @question.destroy
    render json: @question
  end

  private

  def question_params
    params.require(:question).permit(:title, :question)
  end

  def find_question
    @question = Question.find_by_id(params[:id])
  end
end
