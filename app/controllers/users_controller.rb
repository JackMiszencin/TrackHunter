class Users::SessionsController < Devise::SessionsController
	def merchant_selection
		@user = current_user
		@merchants = Merchant.where(:lng => (@user.lng_low)..(@user.lng_up), :lat => (@user.lat_low)..(@user.lat_up))
	end
	def home
		current_user.lng = params[:lng]
		current_user.lng = params[:lat]
	end
  def update
	  @user = User.find(params[:id])
	  if params[:location]
	    respond_to do |format|
	      if @user.update_attributes(params[:user])
	        format.html {redirect_to user_merchant_selection_path(@current_user)}
	        format.json {head :no_content}
	      else
	      end
	    end
	  elsif params[:updated_store]  
	    respond_to do |format|
	      if @user.update_attributes(params[:user])
	        format.html { redirect_to new_rating_path, notice:'User merchant successfully updated.' }
	        format.json { head :no_content }
	      else
	      end 
	    end
	  else  
	    respond_to do |format|
	      if @user.update_attributes(params[:user])
	        format.html { redirect_to @user, notice: 'User was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end 
	    end
	  end
	end
	def new
		if request.post?
				redirect_to home_path(current_user)  
		else
		end
	end

end
