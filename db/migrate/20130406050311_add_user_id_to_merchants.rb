class AddUserIdToMerchants < ActiveRecord::Migration
  def up
  	add_column :merchants, :user_id, :integer
  end
  def down
  	remove_column :merchants, :user_id, :integer
  end
end
