class CreateJourneys < ActiveRecord::Migration[7.1]
  def change
    create_table :journeys do |t|
      t.string :title
      t.string :reason
      t.integer :timeblocks

      t.timestamps
    end
  end
end
