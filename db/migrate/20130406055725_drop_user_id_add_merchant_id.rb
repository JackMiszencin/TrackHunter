class DropUserIdAddMerchantId < ActiveRecord::Migration
  def up
  	remove_column :users, :merchant_id, :integer
  	add_column :merchants, :user_id, :integer
  end

  def down
  	add_column :users, :merchant_id, :integer
  	remove_column :merchants, :user_id, :integer
  end
end
