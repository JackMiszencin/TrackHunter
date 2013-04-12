class AddLngLatToMerchantAndUser < ActiveRecord::Migration
  def change
  	add_column :users, :lat, :float
  	add_column :users, :lng, :float
  	add_column :merchants, :lat, :float
  	add_column :merchants, :lng, :float
  end
end
