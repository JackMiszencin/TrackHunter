class Rating < ActiveRecord::Base
	belongs_to :song
	belongs_to :merchant, :inverse_of => :ratings
  	belongs_to :user
end
