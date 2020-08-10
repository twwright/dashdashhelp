class DashboardsController < ApplicationController
  def show
    @question = Question.new
    @questions = current_user.questions
  end
end