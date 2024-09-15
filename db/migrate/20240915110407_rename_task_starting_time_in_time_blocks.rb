class RenameTaskStartingTimeInTimeBlocks < ActiveRecord::Migration[7.1]
  def change
    rename_column :timeBlocks, :taskStartingTime, :starting_time
    rename_column :timeBlocks, :taskEndingTime, :endting_time
    rename_column :timeBlocks, :task_name, :name

  end
end
