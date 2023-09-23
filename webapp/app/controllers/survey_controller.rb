class SurveyController < ApplicationController
  def index
    @survey = Survey.eager_load(:answers).first
  end

  def vote
    @vote = Vote.new(vote_params)
    if (@vote.save)
      redirect_to action: "show"
    else
      @survey = Survey.eager_load(:answers).first
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @survey = Survey.eager_load(:answers).first
    @answers = Answer.left_joins(:votes)
      .select("answers.*, COUNT(votes.id) as votes_count")
      .group("answers.id").where(survey_id: @survey.id)
    @total = @answers.reduce(0) do |count, a| a.votes_count + count end
    @total = @total.to_f
  end

  private

  def vote_params
    params.permit(:answer_id)
  end
end
