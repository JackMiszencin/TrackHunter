class PreviousSong < ActiveRecord::Base
	attr_accessible :song_id, :merchant_id
  belongs_to :song
  belongs_to :merchant
end
