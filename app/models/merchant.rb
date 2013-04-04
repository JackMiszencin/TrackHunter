class Merchant < ActiveRecord::Base
	attr_accessible :name, :address, :city, :state, :zip_code, :current_song_id, :previous_song_id
	has_and_belongs_to_many :ratings
	has_many :songs, foreign_key: :current_song_id
	has_many :songs, foreign_key: :previous_song_id
end
