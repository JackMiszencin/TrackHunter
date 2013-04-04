class AddSongIndexestoMerchants < ActiveRecord::Migration
  def up
  	add_index :merchants, :current_song_id
  	add_index :merchants, :previous_song_id
  end

  def down
  	remove_column :merchants, :current_song_id
  	remove_column :merchants, :previous_song_id
  end
end
