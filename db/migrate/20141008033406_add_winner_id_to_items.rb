class AddWinnerIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :winnerId, :integer, default: :null
    add_column :items, :isActive, :boolean, default: true
    
  end
end