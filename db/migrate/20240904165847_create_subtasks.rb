class CreateSubtasks < ActiveRecord::Migration[7.1]
  def change
    create_table :subtasks do |t|
      t.string :name
      t.string :left_of_at

      t.timestamps
    end
  end
end
