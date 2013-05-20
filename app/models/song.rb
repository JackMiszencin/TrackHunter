class Song < ActiveRecord::Base # This dummy list of song objects will be replaced when the app is linked into a decent music service.
	attr_accessible :title, :artist, :album
	has_many :ratings, :foreign_key => "song_id"
	has_many :current_merchants, :foreign_key => "current_song_id", :class_name => "Merchant", :inverse_of => :current_song
	has_many :previous_merchants, :foreign_key => "previous_song_id", :class_name => "Merchant", :inverse_of => :previous_song
end
