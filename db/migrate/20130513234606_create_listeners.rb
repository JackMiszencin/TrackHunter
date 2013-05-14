class CreateListeners < ActiveRecord::Migration
  def change
    create_table :listeners do |t|
    	t.integer :user_id
    	t.integer :merchant_id
    	t.string :account_id
    	t.float :lat, :null => false, :default => 0
    	t.float :lng, :null => false, :default => 0
      t.timestamps
    end
  end
end
