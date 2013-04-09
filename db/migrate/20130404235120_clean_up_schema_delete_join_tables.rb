class CleanUpSchemaDeleteJoinTables < ActiveRecord::Migration
  def up
  	drop_table :previous_songs
  	drop_table :current_songs
   
  end

  def down
    raise ActiveRecord::IrreversibleMigration 
  end
end
