class Song < ActiveRecord::Base
	attr_accessible :title, :artist, :album
	has_and_belongs_to_many :ratings
  # attr_accessible :title, :body
end
