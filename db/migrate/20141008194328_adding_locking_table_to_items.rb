class AddingLockingTableToItems < ActiveRecord::Migration
  def change
    add_column :items, :lock_version, :integer
  end
end