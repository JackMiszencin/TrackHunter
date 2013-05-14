class Listener < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user_id, :merchant_id, :lng, :lat
  belongs_to :merchant
  belongs_to :user
  has_many :ratings, :foreign_key => "listener_id"

	def deg_per_met
		r = 6371000
		latrad = lat.abs * (2*Math::PI/360)
		rprime = r * Math.sin(latrad)
		return 360 / (rprime*2*Math::PI)
	end
  
  def lng_up
  	return lng + (65 * deg_per_met)
  end
  def lng_low
  	return lng - (65 * deg_per_met)
  end
  def lat_up
  	return lat + (50 * deg_per_met)
  end
  def lat_low
  	return lat - (50 * deg_per_met)
  end

end
