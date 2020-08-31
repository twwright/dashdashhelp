class QuestionsController < ApplicationController

  def show
    @question = Question.find(params[:id])
    if current_user
      @answer = @question.answers.build
    end
  end

  def new
    if !current_user
      redirect_to sign_in_path
    else
      @question = Question.new
    end
  end

  def create
    @question = current_user.questions.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to question_path(@question), redirect_options_for(@question)
    else
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:body, :title, :image)
  end

  def redirect_options_for(question)
    if question.persisted?
      { notice: "Question successfully asked!" }
    else
      { alert: "Could not ask question" }
    end
  end
end