class Song < ActiveRecord::Base
	attr_accessible :title, :artist, :album
	has_many :ratings
	#has_many :previous_songs
	#has_many :merchants, through: :previous_songs
	#has_many :current_songs
	#has_many :merchants, through: :current_songs
	has_many :merchants
  # attr_accessible :title, :body
end
