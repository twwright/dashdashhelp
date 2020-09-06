class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  validates :user_id, uniqueness: { scope: :answer_id } # only one pair of user_id/answer_id that is upvoted
end
