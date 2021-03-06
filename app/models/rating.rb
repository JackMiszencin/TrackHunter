class Rating < ActiveRecord::Base
	belongs_to :song
	belongs_to :merchant
	belongs_to :listener
	# The relationship below, once again helps simplify accessing the name of shop owners in the Ratings#index page.
	has_one :owner, :class_name => "User", :through => :merchant, :source => :owner
	has_one :user, :through => :listener

	def time_print
		date = [created_at.month%b, created_at.day]
		full_date = [date.join(" "), created_at.year]
		return full_date.join(", ")
	end

	# Used to simplify accessing the name of merchants in Ratings#index
	def merchant_name
		m = Merchant.find_by_id(merchant_id)
		return m.name
	end

end	
