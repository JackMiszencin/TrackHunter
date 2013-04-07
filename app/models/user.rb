class User < ActiveRecord::Base
  attr_accessible :username
  belongs_to :merchant
  has_many :ratings, :foreign_key => "user_id"
  has_one :current_merchant, :class_name => "Merchant"
end
