class AddEventUserIdToEventPlaces < ActiveRecord::Migration[5.1]
  def up
    add_column :event_places, :event_user_id, :integer
  end

  def down
    remove_column :event_places, :event_user_id
  end
end
