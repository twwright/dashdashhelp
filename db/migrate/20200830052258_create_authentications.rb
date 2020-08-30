class CreateAuthentications < ActiveRecord::Migration[6.0]
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :token

      t.timestamps
    end
  end
end
