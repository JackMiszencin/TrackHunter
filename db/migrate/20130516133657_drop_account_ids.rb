class DropAccountIds < ActiveRecord::Migration
  def up
  	remove_column :listeners, :account_id
  	remove_column :merchants, :account_id
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
