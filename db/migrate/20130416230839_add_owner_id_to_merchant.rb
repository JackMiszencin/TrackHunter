class AddOwnerIdToMerchant < ActiveRecord::Migration
  def change
  	add_column :merchants, :owner_id, :integer, :default => 1, :null => false
  end
end
