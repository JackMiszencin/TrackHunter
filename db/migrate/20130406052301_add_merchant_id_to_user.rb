class AddMerchantIdToUser < ActiveRecord::Migration
  def up
  	add_column :users, :merchant_id, :integer
  end
  def down
  	remove_column :users, :merchant_id, :integer
  end
end
