class AddPersonsCountToEvents < ActiveRecord::Migration[5.1]
  def up
    add_column :events, :persons_count, :integer
  end

  def down
    remove_column :events, :persons_count
  end
end
