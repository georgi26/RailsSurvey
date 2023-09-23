class SurveyController < ApplicationController
  def index
    @survey = Survey.eager_load(:answers).first
  end

  def vote
    @vote = Vote.new(vote_params)
    redirect_to action: "show"
  end

  def show
  end

  private

  def vote_params
    params.require(:answer_id)
  end
end
