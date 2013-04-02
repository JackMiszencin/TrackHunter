class Rating < ActiveRecord::Base
	has_many :songs
	has_and_belongs_to_many :merchant, :limit => 1
  # attr_accessible :title, :body
end
