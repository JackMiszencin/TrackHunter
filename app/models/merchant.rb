class Merchant < ActiveRecord::Base
	attr_accessible :name, :address, :city, :state, :zip_code, :current_song_id, :previous_song_id, :previous_song, :current_song
	has_and_belongs_to_many :ratings
	#has_one :previous_song
	#has_one :song, through: :previous_song
	#has_one :current_song
	#has_one :song, through: :current_song
	belongs_to :previous_song, :class_name => "Song"
	belongs_to :current_song, :class_name => "Song"

end
