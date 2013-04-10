class AccountsController < ApplicationController    
  before_filter :user_login, :only => :login 
  
  def user_login 
    if @current_user.nil?
    else 
      redirect_to user_home_path(@current_user)
    end
  end 
  
	def login
  	if request.post?
  		if User.find_by_username(params[:username]).nil?
  			flash[:notice] = "This username does not exist. To 
  			create a new account, click the link below."
  			redirect_to accounts_login_path
  		else
  			@current_user = User.find_by_username(params[:username])
  			session[:user_id] = @current_user[:id]
  			redirect_to @current_user 
  		end
  	end
  end
  def logout
  end
  
end
                                                                                                            