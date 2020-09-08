class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  belongs_to :user
  has_many :respondents, through: :answers, source: :users

  has_one_attached :image

  validates :title, presence: true, length: { in: 1... 100 }
  validates :body, presence: true, length: { in: 1... 1000 }

  default_scope { order(created_at: :desc) }
  scope :unanswered, -> { left_outer_joins(:answer).where("question.answer_id is null").order(created_at: :desc) }

  delegate :username, to: :user # blocks law of demeter violation in _question

  def answers_count
    self.answers.count
  end

end

