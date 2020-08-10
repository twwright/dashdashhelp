class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def create
    question = current_user.questions.create(question_params)
    redirect_to root_path, redirect_options_for(question)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def redirect_options_for(question)
    if question.persisted?
      { notice: "Question successfully asked!" }
    else
      { alert: "Could not ask question" }
    end
  end
end