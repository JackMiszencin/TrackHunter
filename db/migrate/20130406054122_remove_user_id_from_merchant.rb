class RemoveUserIdFromMerchant < ActiveRecord::Migration
  def up
  	remove_column :merchants, :user_id, :integer
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
