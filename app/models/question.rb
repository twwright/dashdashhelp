class Question < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 1... 1000 }
  validates :user, presence: true
end
