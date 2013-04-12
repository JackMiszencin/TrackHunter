class User < ActiveRecord::Base
  attr_accessible :username, :password, :account_id, :merchant_id
  belongs_to :merchant
  has_many :ratings, :foreign_key => "user_id"

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



end
