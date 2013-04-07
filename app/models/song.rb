class Song < ActiveRecord::Base
	attr_accessible :title, :artist, :album
	has_many :ratings, :foreign_key => "song_id"
	#has_many :previous_songs
	#has_many :merchants, through: :previous_songs
	#has_many :current_songs
	#has_many :merchants, through: :current_songs
	has_many :current_merchants, :foreign_key => "current_song_id", :class_name => "Merchant", :inverse_of => :current_song
	has_many :previous_merchants, :foreign_key => "previous_song_id", :class_name => "Merchant", :inverse_of => :previous_song
  # attr_accessible :title, :body
end
