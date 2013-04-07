class AddMumboToRating < ActiveRecord::Migration
  def up
  	add_column :ratings, :mumbo, :integer
  end
  def down
  	remove_column :ratings, :mumbo, :integer
  end
end
