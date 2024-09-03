class AddAfterCompletingToTimeblocks < ActiveRecord::Migration[7.1]
  def change
    add_column :timeblocks, :after_completing, :string
  end
end
