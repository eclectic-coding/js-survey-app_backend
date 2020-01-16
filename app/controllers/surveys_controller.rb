class SurveysController < ApplicationController
  # Two methods we dont use in API mode - new and edit
  before_action :find_survey, only: %i[show update destroy]

  def index
    @surveys = Survey.all
    render json: @surveys
  end

  def show
    @survey = Survey.find_by_id(params[:id])
    render json: @survey
  end

  def create
    # New create action to handle data request from JS to database
    @survey = Survey.new(survey_params)
    if @survey.save
      render json: @survey
    else
      render json: { error: @survey.error.full_messages }
    end
  end

  def update
    if @survey.update(survey_params)
      render json: @survey
    else
      render json: { error: @survey.error.full_messages }
    end
  end

  def destroy
    @survey.destroy
    render json: @survey
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :question1, :question2, :question3)
  end

  def find_survey
    @survey = Survey.find_by_id(params[:id])
  end
end

