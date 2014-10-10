class AddDefaultsToDb < ActiveRecord::Migration
  def change
    change_column_default :items, :winningAmt, 0
    change_column_default :items, :lock_version, 0
    
  end
end