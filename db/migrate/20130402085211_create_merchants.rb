class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|

      t.timestamps
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :current_song_id
      t.integer :previous_song_id
    end
    add_column :ratings, :merchant_id, :integer
    add_index :ratings, :merchant_id
  end
end
