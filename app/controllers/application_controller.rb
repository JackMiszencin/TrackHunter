class ApplicationController < ActionController::Base
	before_filter :get_user
	protected
	def get_user
		return if session[:user_id].blank?
		@current_user = User.find_by_id(session[:user_id])
	end
  protect_from_forgery
end
