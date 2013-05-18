class Users::SessionsController < Devise::SessionsController

#Custom material starts here.

	def merchant_selection
		@user = @current_user
		@merchants = Merchant.where(:lng => (@user.lng_low)..(@user.lng_up), :lat => (@user.lat_low)..(@user.lat_up))
	end
	def home
		@user = @current_user
		if request.post?
			@current_user.lng = params[:lng]
			@current_user.lng = params[:lat]
			@current_user.save
			
			respond_to do |format|
				format.html
				format.json { render json: @user }
			end
		end
	end
#	def new
#		if request.post?
#				redirect_to home_path(current_user)  
#		else
#		end
#	end

end
