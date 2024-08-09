class ChangeIntegerToArrayInJourneys < ActiveRecord::Migration[7.1]
  def change
    remove_column :journeys, :timeblocks
  end
end
