class PreviousSong < ActiveRecord::Migration
  def up
  	create_table :previous_songs do |t|
  		t.integer :song_id
  		t.integer :merchant_id
    end
    add_index :previous_songs, :song_id
    add_index :previous_songs, :merchant_id
  end

  def down
  end
end
