class AddMerchantsToSongs < ActiveRecord::Migration
  def up
  	add_column :songs, :merchant_ids, :integer
  end
  def down
  	remove_column :songs, :merchant_ids
  end
end
