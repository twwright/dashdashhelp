class UpvotesController < ApplicationController
  before_action :require_login

  def create
    current_user.upvote(question)
    redirect_to root_path
  end

  def destroy
    current_user.unvote(question)
    redirect_to root_path
  end

  private
  def question
    @_question ||= Question.find(params[:id]) # would be question_id if nested resource!
  end
end