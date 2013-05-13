class UpdateUsers < ActiveRecord::Migration
  def up
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :username, :string
  	add_column :users, :lat, :float
  	add_column :users, :lng, :float
  	add_column :users, :is_merchant, :boolean, :default => false, :null => false
  	add_column :users, :is_admin, :boolean, :default => false, :null => false
  end

  def down
  end
end
