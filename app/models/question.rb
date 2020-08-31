class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user
  has_one_attached :image

  validates :body, presence: true, length: { in: 1... 1000 }

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user # blocks law of demeter violation in _question using applicationrecord macro
end
