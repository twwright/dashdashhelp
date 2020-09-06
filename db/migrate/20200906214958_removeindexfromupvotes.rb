class Removeindexfromupvotes < ActiveRecord::Migration[6.0]
  def up
        remove_index :upvotes, name: "index_upvotes_on_user_id_and_question_id"
  end
end
