class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user_id, uniqueness: { scope: :question_id } # only one pair of user_id/question_id that is upvoted
end
