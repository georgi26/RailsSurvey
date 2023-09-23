class Answer < ApplicationRecord
  belongs_to :survey
  has_many :votes
  attr_accessor :votes_percent

  def self.load_with_votes_by_survey_id(surveyId)
    result = Answer.left_joins(:votes)
      .select("answers.*, COUNT(votes.id) as votes_count")
      .group("answers.id").where(survey_id: surveyId)
    total = result.reduce(0) do |count, a|
      a.votes_count + count
    end
    total = total.to_f
    result.each do |ans|
      ans.votes_percent = 0
      if (total > 0)
        ans.votes_percent = ((ans.votes_count / total) * 100).to_i
      end
    end
    result
  end
end
