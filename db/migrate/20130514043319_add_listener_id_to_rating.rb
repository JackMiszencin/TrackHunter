class AddListenerIdToRating < ActiveRecord::Migration
  def up
  	remove_column :ratings, :user_id
  	add_column :ratings, :listener_id, :integer
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
