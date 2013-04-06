class User < ActiveRecord::Base
  attr_accessible :username
  belongs_to :merchant
end
