module AnswerHelper
  def vote_button(answer)
    if current_user.upvoted?(answer)
      link_to "Unvote", unvote_question_answers_path(answer.question_id, answer_id: answer.id), method: :delete
    else
      link_to "Upvote", upvote_question_answers_path(answer.question_id, answer_id: answer.id), method: :post
    end
  end
end