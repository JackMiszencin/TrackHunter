class RemoveAttrsFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :lat
  	remove_column :users, :lng
  	remove_column :users, :merchant_id
  	remove_column :users, :username
  end

  def down
  	remove_column :users, :lat, :float
  	remove_column :users, :lng, :float
  	remove_column :users, :merchant_id, :integer
  	remove_column :users, :username, :string

  end
end
