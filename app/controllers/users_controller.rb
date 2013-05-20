class Users::SessionsController < Devise::SessionsController


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
end
