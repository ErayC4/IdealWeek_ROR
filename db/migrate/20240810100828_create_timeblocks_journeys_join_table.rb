class CreateTimeblocksJourneysJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :timeblocks, :journeys do |t|
      t.index [:timeblock_id, :journey_id]
      t.index [:journey_id, :timeblock_id]
    end
  end
end
