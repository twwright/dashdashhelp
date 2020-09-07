module AnswerHelper
  def vote_button(answer)
    if current_user.upvoted?(answer)
      link_to "Unvote", unvote_answer_path(answer.id), method: :delete
    else
      link_to "Upvote", upvote_answer_path(answer.id), method: :post
    end
  end
end