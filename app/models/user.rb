class User < ApplicationRecord
  include Clearance::User
  require 'securerandom'

  validates :username, presence: true, uniqueness: true

  has_many :authentications, dependent: :destroy

  has_many :answers
  has_many :questions

  has_many :upvotes
  has_many :upvoted_questions, through: :upvotes, source: :question

  def self.create_with_auth_and_hash(authentication, auth)
    if user = find_by(email: auth["info"]["email"])
      user.authentications << authentication
    else
      create! do |user|
        user.username = auth["info"]["nickname"]
        user.email = auth["info"]["email"]
        user.password = SecureRandom.urlsafe_base64
        user.authentications << authentication
      end
    end
  end

  # def password_optional?
  #   true
  # end

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
    username # changes /:id to /:username
  end

end
