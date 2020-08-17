class ChangeBodyToBeTextInQuestions < ActiveRecord::Migration[6.0]
  def up
    change_column :questions, :body, :text
  end

  def down
    change_column :questions, :body, :string
  end
end
