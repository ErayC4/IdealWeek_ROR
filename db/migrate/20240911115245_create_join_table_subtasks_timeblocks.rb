class CreateJoinTableSubtasksTimeblocks < ActiveRecord::Migration[7.1]
  def change
    create_join_table :subtasks, :timeblocks do |t|
      t.index [:subtask_id, :timeblock_id]
      t.index [:timeblock_id, :subtask_id]
    end
  end
end
