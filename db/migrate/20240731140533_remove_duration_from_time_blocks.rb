class RemoveDurationFromTimeBlocks < ActiveRecord::Migration[7.1]
  def change
    remove_column :timeBlocks, :duration, :integer
  end
end
