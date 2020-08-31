class AnswersController < ApplicationController
  def show
    @answer = answer.find(params[:id])
  end

  def new
    if !current_user
      redirect_to sign_in_path
    else
      @answer = Answer.new
    end
  end

  def create
    @answer = current_user.answers.build(answer_params)
    @answer.question_id = params[:question_id]
    @answer.save
    redirect_to question_path(@answer.question_id), redirect_options_for(@answer)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :image, :question_id, :user_id)
  end

  def redirect_options_for(answer)
    if answer.persisted?
      { notice: "Answer submitted!" }
    else
      { alert: "Could not submit answer" }
    end
  end
end