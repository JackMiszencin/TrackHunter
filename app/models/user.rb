class User < ActiveRecord::Base
  attr_accessible :username, :password, :account_id, :merchant_id
  belongs_to :merchant
  has_many :ratings, :foreign_key => "user_id"
  has_one :current_merchant, :class_name => "Merchant"
end
