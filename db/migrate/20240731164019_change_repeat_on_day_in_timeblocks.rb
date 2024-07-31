class ChangeRepeatOnDayInTimeblocks < ActiveRecord::Migration[7.1]
  def change
    change_column :timeBlocks, :repeatOnDay, :integer
  end
end
