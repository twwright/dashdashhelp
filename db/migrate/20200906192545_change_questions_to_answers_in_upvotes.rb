class ChangeQuestionsToAnswersInUpvotes < ActiveRecord::Migration[6.0]
  def up
    change_table :upvotes do |t|
      t.remove_references :question, index: true
      t.references :answer, index: true
    end
    
    add_index :upvotes, [:user_id, :answer_id], unique: true
  end

  def down
    change_table :upvotes do |t|
      t.references :question, null: false, foreign_key: true
      t.remove_references :answer, index: true
    end

    add_index :upvotes, [:user_id, :question_id], unique: true
  end
end
