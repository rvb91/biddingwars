class AddPaymentBlockedToBids < ActiveRecord::Migration
  def change
    add_column :bids, :payment_blocked, :boolean, default: true
  end
end