class ResponsesController < ApplicationController
  before_action :find_response, only: %i[show update destroy]

  def index
    @responses = Response.all
  end

  def show
    @response = Response.find_by_id(params[:id])
    render json: @response
  end

  def create
    @response = Response.new(response_params)
    if @response.save
      render json: @response
    else
      render json: { error: @survey.error.full_messages }
    end
  end

  def update
    if @response.update(response_params)
      render json: @response
    else
      render json: { error: @response.error.full_messages }
    end
  end

  def destroy
    @response.destroy
    render json: @response
  end

  private

  def response_params
    params.require(:response).permit(:response, :survey_id)
  end

  def find_response
    @response = Response.find_by_id(params[:id])
  end

end
