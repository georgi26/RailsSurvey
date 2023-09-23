class SurveyController < ApplicationController
  def index
    @survey = loadSurvey
  end

  def vote
    @vote = Vote.new(vote_params)
    if (@vote.save)
      redirect_to action: "show"
    else
      @survey = loadSurvey
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @survey = loadSurvey
    @answers = @survey.answers_with_votes
  end

  private

  def vote_params
    params.permit(:answer_id)
  end

  def loadSurvey()
    Survey.eager_load(:answers).first
  end
end
