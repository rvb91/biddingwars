class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :userId
      t.integer :budget, default:0

      t.timestamps
    end
  end
end
