class AddEventPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :event_places do |t|
      t.string :title
      t.string :description
      t.integer :floor
      t.integer :places_count

      t.timestamps null: false
    end

    add_index :event_places, :title
    add_index :event_places, :floor
    add_index :event_places, :places_count
  end
end
