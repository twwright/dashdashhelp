class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    verify_owner @answer
  end

  def show
  end

  def new
    if signed_out?
      redirect_to sign_in_path
    else
      @answer = Answer.new
      @question = Question.find_by(id: params[:question_id])
    end
  end

  def create
    @answer = current_user.answers.build(answer_params)
    @answer.question_id = params[:question_id]
    if @answer.save
      flash[:success] = 'Answer created successfully!'
      redirect_to @answer.question
    else
      flash[:danger] = 'Something went wrong.'
      redirect_to @answer.question
    end
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
    @question = Question.find_by(id: params[:question_id])
  end

  def update
    if @answer.update(answer_params)
      flash[:success] = "Answer updated successfully."
      redirect_to @answer.question
    else
      flash[:danger] = "Something went wrong."
      render @answer.question
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = "Your answer has been deleted."
    redirect_to @answer.question
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :image, :question_id, :user_id)
  end

  def set_answer
    @answer = Answer.find_by(id: params[:id]) or not_found
  end

  def verify_owner(obj)
    if obj.user_id != current_user.id
      redirect_to obj.question
    end
  end
end