class Survey < ApplicationRecord
  has_many :answers

  def answers_with_votes
    Answer.load_with_votes_by_survey_id(self.id)
  end
end
