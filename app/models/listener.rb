class Listener < ActiveRecord::Base # The listener serves as a place-holder to represent the user
  # in matters of creating ratings, both to distinguish from the user's role as merchant and listener
  # and to prevent issues encountered when altering devise's controllers.
  attr_accessible :user_id, :merchant_id, :lng, :lat
  belongs_to :merchant
  belongs_to :user
  has_many :ratings, :foreign_key => "listener_id"

  # This method calculates an estimate of the number of meters in a longitudinal or latitudinal degree based on "r", or the
  # average radius of the earth, and the latitude (north vs. south) at which the user is located.
	def deg_per_met
		r = 6371000
		latrad = lat.abs * (2*Math::PI/360) # Converts latitudinal degrees into radians for the sake of sake of Ruby's sin function.
		rprime = r * Math.sin(latrad) # Using SOHCAHTOA to get the horizontal cross-sectional radius of the earth at the user's latitude.
		return 360 / (rprime*2*Math::PI) # Takes this radius and uses it to get the cross-sectional circumference at that point in meters
    # and return 360 degrees by this circumferences to get degrees per meter.
	end
  
  # The following four methods create the bounds of a range of coordinates for longitude and latitude that will be accepted
  # by the users controller when selecting those merchants at which the user might currently be located in order to assign the
  # current_merchant attribute. (See Users#merchant_selection). If problems arrise related to these functions, check to see if
  # it has something to do with them being eliminated from the merchant model.
  def lng_up
  	return lng + (65 * deg_per_met)
  end
  def lng_low
  	return lng - (65 * deg_per_met)
  end
  def lat_up
  	return lat + (65 * deg_per_met)
  end
  def lat_low
  	return lat - (65 * deg_per_met)
  end

end
