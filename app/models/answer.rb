class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_one_attached :image

  validates :content, presence: true
  validates :user, presence: true

  default_scope { order(created_at: :desc) }
end
