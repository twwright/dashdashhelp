class User < ApplicationRecord
  include Clearance::User
  require 'securerandom'

  validates :username, presence: true, uniqueness: true

  has_many :authentications, dependent: :destroy

  has_many :answers
  has_many :questions, through: :answers

  has_many :upvotes, dependent: :destroy
  has_many :upvoted_answers, through: :upvotes, source: :answer

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

  def upvote(answer)
    upvoted_answers << answer
  end

  def unvote(answer)
    upvoted_answers.destroy(answer)
  end

  def upvoted?(answer)
    upvoted_answer_ids.include?(answer.id)
  end

  def to_param
    username # changes /:id to /:username
  end

end
