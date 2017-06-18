class AddUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :telegram_id

      t.timestamps null: false
    end

    add_index :users, :telegram_id, unique: true
  end
end
