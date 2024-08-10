class AddColumnToJourneys < ActiveRecord::Migration[7.1]
  def change
    add_column :journeys, :user_id, :integer
  end
end
