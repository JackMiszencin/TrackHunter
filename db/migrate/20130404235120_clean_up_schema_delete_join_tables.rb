class CleanUpSchemaDeleteJoinTables < ActiveRecord::Migration
  def up
  	drop_table :previous_songs
  	drop_table :current_songs
  	remove_index "merchant_id", :name => "previous_songs"
  	remove_index "song_id", :name => "previous_songs"
  	remove_index "merchant_id", :name => "current_songs"
  	remove_index "song_id", :name => "current_songs"
  	drop_table :pages
  end

  def down
    raise ActiveRecord::IrreversibleMigration 
  end
end
