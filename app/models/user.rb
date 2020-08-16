class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true

  has_many :questions, dependent: :destroy
  has_many :upvotes
  has_many :upvoted_questions, through: :upvotes, source: :question

  def upvote(question)
    upvoted_questions << question
  end

  def unvote(question)
    upvoted_questions.destroy(question)
  end

  def upvoted?(question)
    upvoted_question_ids.include?(question.id)
  end

  def to_param
    username # changes /id to /username
  end

end
