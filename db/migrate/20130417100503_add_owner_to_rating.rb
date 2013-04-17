class AddOwnerToRating < ActiveRecord::Migration
  def change
  	add_column :ratings, :owner_id, :integer
  	add_index :ratings, :owner_id
  end
end
