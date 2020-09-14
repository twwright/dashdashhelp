class DashboardsController < ApplicationController
  def show
    @questions = Question.all
  end

  def unanswered
    @questions = Question.unanswered
  end
end