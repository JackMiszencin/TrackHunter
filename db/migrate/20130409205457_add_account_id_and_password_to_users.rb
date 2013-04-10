class AddAccountIdAndPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :string
    add_column :users, :password, :string
  end
end
