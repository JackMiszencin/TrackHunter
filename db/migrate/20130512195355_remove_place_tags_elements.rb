class RemovePlaceTagsElements < ActiveRecord::Migration
  def up
  	drop_table :atlases
  	drop_table :events
  	drop_table :events_reports
  	drop_table :reports
  	remove_column :ratings, :mumbo
  	drop_table :sizes
  	drop_table :tags
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
