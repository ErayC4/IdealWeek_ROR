class CreateTimeblocks < ActiveRecord::Migration[7.1]
  def change
    create_table :timeblocks do |t|
      t.string :task_name
      t.time :taskStartingTime
      t.time :taskEndingTime
      t.string :repeatOnDay
      t.boolean :dailyRepeat

      t.timestamps
    end
  end
end
