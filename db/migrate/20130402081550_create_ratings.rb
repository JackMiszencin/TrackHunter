class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|

      t.timestamps
      t.boolean :like
      t.references :user
    end
  end
end
