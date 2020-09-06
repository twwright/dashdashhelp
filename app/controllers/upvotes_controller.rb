class UpvotesController < ApplicationController
  before_action :require_login

  def create
    current_user.upvote(answer)
    redirect_to question_path(params[:question_id])
  end

  def destroy
    current_user.unvote(answer)
    redirect_to question_path(params[:question_id])
  end

  private
  def answer
    @_answer ||= Answer.find(params[:answer_id]) # would be answer_id if nested resource!
  end
end