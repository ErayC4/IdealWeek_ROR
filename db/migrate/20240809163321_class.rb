class Class < ActiveRecord::Migration[7.0]
  def change
    add_column :journeys, :timeblocks, :integer, array: true, default: []
  end
end
