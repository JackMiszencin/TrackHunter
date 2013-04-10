class AddAccountIdToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :account_id, :integer
  end
end
