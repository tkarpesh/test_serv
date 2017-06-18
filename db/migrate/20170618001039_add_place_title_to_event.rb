class AddPlaceTitleToEvent < ActiveRecord::Migration[5.1]
  def up
    add_column :events, :place_title, :string
  end

  def down
    remove_column :events, :place_title
  end
end
