class ChangeTaskStartingTimeTimeblocks < ActiveRecord::Migration[7.1]
  def change
    change_column :timeBlocks, :taskStartingTime, :string
  end
end
