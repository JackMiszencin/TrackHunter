class CreateCurrentSongs < ActiveRecord::Migration
  def up
  	create_table :current_songs do |t|
  		t.integer :song_id
  		t.integer :merchant_id
  	end
  	add_index :current_songs, :song_id
  	add_index :current_songs, :merchant_id
  end

  def down
  end
end
