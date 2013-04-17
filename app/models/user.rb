class User < ActiveRecord::Base
  attr_accessible :username, :password, :account_id, :merchant_id, :lng, :lat, :is_admin, :is_merchant
  belongs_to :merchant
  has_many :ratings, :foreign_key => "user_id"
  has_many :businesses, :class_name => "Merchant", :foreign_key => "owner_id", :inverse_of => :owner
  has_many :owner_ratings, :class_name => "Rating", :through => :businesses, :source => :ratings

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
