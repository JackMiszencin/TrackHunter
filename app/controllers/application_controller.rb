class ApplicationController < ActionController::Base
	before_filter :get_user, :except => :login
	after_filter :get_loc, :only => :home
	protected
	def get_user
		return if session[:user_id].blank?
		@current_user = User.find_by_id(session[:user_id])
	end
	def get_loc
        @current_user.lng = params[:lng]
        @current_user.lat = params[:lat]
  end
  protect_from_forgery
end
