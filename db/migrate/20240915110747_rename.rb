class Rename < ActiveRecord::Migration[7.1]
  def change
    rename_column :timeBlocks, :repeatOnDay, :repeat_on_day

  end
end
