module QuestionHelper
  def vote_button(question)
    if current_user.upvoted?(question)
      button_to "Unvote", unvote_question_path(question), method: :delete, class: "btn btn-primary.upvote"
    else
      button_to "Upvote", upvote_question_path(question), method: :post, class: "btn btn-primary"
    end
  end
end