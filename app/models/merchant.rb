class Merchant < ActiveRecord::Base
	attr_accessible :name, :address, :city, :state, :zip_code, :account_id, :current_song_id,  :previous_song_id, :previous_song, :current_song
	has_many :ratings, :foreign_key => "merchant_id", :inverse_of => :merchant
	belongs_to :previous_song, :class_name => "Song", :inverse_of => :previous_merchants
	belongs_to :current_song, :class_name => "Song", :inverse_of => :current_merchants
	has_many :listeners, :foreign_key => "merchant_id"
	belongs_to :owner, :class_name => "User", :inverse_of => :businesses
	belongs_to :owner_rating, :class_name => "Rating", :dependent => :destroy

	def make_address
		full_address = [address.gsub(" ", "+"), city, state, zip_code.to_s]
		return full_address.join("+")
	end
	def deg_per_met
		r = 6371000
		latrad = lat.abs * (2*Math::PI/360)
		rprime = r * Math.sin(latrad)
		return 360 / (rprime*2*Math::PI)
	end
  def lng_up
  	return lng + (50 * deg_per_met)
  end
  def lng_low
  	return lng - (50 * deg_per_met)
  end
  def lat_up
  	return lat + (50 * deg_per_met)
  end
  def lat_low
  	return lat - (50 * deg_per_met)
  end
  def format_zip
  	zeroes = 0
  	zip = self.zip_code
  	line = zip.to_s
  	if line.length < 5
  		zeroes = 5 - line.length
  		parts = Array.new
  		zeroes.times { parts << "0" }
  		addition = parts.join("")
  		line = addition + line
  	else
  		line = line
  	end
  	return line
  end


#	def assign_loc(hash)
#    	coor = hash["results"][0]["geometry"]["location"]
#    	lat = coor["lat"]
#    	lng = coor["lng"]
#	end

end
