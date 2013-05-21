class DestroyZipCode < ActiveRecord::Migration
  def up
  	remove_column :merchants, :zip_code
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
