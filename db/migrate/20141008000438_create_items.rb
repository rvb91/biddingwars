class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :userId
      t.string :itemName
      t.integer :startPrice

      t.timestamps
    end
  end
end
