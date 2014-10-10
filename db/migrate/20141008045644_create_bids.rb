class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :item_id
      t.integer :userId
      t.integer :amount

      t.timestamps
    end
    
    add_column :items, :winningAmt, :integer
  end
end