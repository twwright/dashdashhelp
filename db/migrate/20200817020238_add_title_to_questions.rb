class AddTitleToQuestions < ActiveRecord::Migration[6.0]
  def up
    add_column :questions, :title, :string
    connection.update("UPDATE questions SET title = 'Result of adding a title'")
    change_column_null :questions, :title, false
  end

  def down
    remove_column :questions, :title
  end
end
