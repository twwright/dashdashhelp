class DashboardsController < ApplicationController
  def show
    @question = Question.new
    @questions = Question.all
  end

  def unanswered
    @question = Question.new
    @questions = Question.unanswered
  end
end