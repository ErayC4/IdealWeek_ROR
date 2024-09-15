class RenameEndtingTimeInTimeBlocksToEndingTime < ActiveRecord::Migration[7.1]
  def change
    rename_column :timeBlocks, :endting_time, :ending_time

  end
end
