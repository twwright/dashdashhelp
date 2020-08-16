module QuestionHelper
  def vote_button(question)
    if current_user.upvoted?(question)
      button_to "Unvote", unvote_question_path(question), method: :delete
    else
      button_to "Upvote", upvote_question_path(question), method: :post
    end
  end
end