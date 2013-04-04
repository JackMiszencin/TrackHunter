class CurrentSong < ActiveRecord::Base
	attr_accessible :merchant_id, :song_id
	belongs_to :merchant
	belongs_to :song
end