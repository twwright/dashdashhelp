class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    verify_owner @question
  end

  def show
    if current_user
      @answer = @question.answers.build
    end
  end

  def new
    if signed_out?
      redirect_to sign_in_path
    else
      @question = Question.new
    end
  end

  def create
    @question = current_user.questions.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:notice] = 'Question created successfully.'
      redirect_to question_path(@question)
    else
      flash.now[:danger] = 'Something went wrong.'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: "Question updated successfully."
    else
      render :edit, alert: "Something went wrong."
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path, notice: "Your question has been deleted."
  end

  private

  def question_params
    params.require(:question).permit(:body, :title, :image)
  end

  def set_question
    @question = Question.find_by(id: params[:id]) or not_found
  end

  def verify_owner(obj)
    if obj.user_id != current_user.id
      redirect_to question_path(obj)
    end
  end
end