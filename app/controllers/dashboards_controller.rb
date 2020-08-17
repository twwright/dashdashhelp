class DashboardsController < ApplicationController
  def show
    @question = Question.new
    @questions = Question.all
  end
end