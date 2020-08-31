class AddTimestampsToAnswers < ActiveRecord::Migration[6.0]
  def up
    add_timestamps :answers, default: nil, null: true
    change_column_null(:answers, :created_at, false, Time.zone.now)
    change_column_null(:answers, :created_at, false, Time.zone.now)
  end

  def down
    remove_column :answers, :created_at
    remove_column :answers, :updated_at
  end
end