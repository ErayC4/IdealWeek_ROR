class AddUserIdToTimeblocks < ActiveRecord::Migration[7.1]
  def change
    add_column :timeblocks, :user_id, :integer
    add_index :timeblocks, :user_id
  end
end
