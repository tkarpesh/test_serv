class AddEventUser < ActiveRecord::Migration[5.1]
  def change
    create_table :event_users do |t|
      t.integer :user_id
      t.integer :event_place_id
      t.integer :count
      t.datetime :expiration

      t.timestamps null: false
    end

    add_index :event_users, :user_id
    add_index :event_users, :expiration
  end
end
