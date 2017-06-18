class AddEventPlaceType < ActiveRecord::Migration[5.1]
  def up
    add_column :event_places, :enjoy_type, :integer
  end

  def down
    remove_column :event_places, :enjoy_type
  end
end
