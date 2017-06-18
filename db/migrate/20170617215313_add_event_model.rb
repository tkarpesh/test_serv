class AddEventModel < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :event_type
      t.integer :floor

      t.timestamps null: false
    end

    add_index :events, :user_id
  end
end
