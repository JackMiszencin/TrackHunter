class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|

      t.timestamps
      t.string :artist
      t.string :title
      t.string :album
    end
    add_column :ratings, :song_id, :integer
    add_index :ratings, :song_id
  end
end
