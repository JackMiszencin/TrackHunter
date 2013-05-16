class ApplicationController < ActionController::Base
	after_filter :get_user, :only => [:create, :destroy]
	after_filter :get_loc, :only => :home
	before_filter :is_current, :only => [:destroy, :index, :edit]
	before_filter :merchant_guard, :only => [:edit, :destroy]
#  before_filter :authenticate_user!, :except => [:new]
	before_filter :is_logged_in, :except => [:new, :create]
	before_filter :songs_filter
	before_filter :rating_guard, :only => [:edit, :destroy]
  before_filter :create_listener, :only => :create
  after_filter :set_listener, :only => :create
#  before_filter :set_current_listener, :only => :create
  prepend_before_filter :set_current_user
	protected
#  def set_current_listener
#    if self.controller_name == "sessions"
#      user = User.find_for_authentication(:email => params[:user][:email])
#      @current_listener = user.listener
#    else
#    end
#  end
  def set_current_user
    if current_user == nil
      @current_user == User.find_for_authentication(:id => nil)
    else
      @current_user = User.find_for_authentication(:id => current_user.id)
    end
  end
	def songs_filter
		return unless self.controller_name == "songs"
		if !current_user.is_admin
			flash[:notice] = "Sorry, you can't visit this page unless you're an administrator."
			redirect_to user_home_path(current_user)
		else
			return
		end
	end
  def create_listener
    return unless self.controller_name == "registrations"
    @listener = Listener.new
    @listener.save
    @current_listener = @listener
  end
  
  def set_listener
    return unless self.controller_name == "registrations"
    user = User.find_for_authentication(:email => params[:user][:email])
    @current_listener.user_id = user.id
    user.listener = @current_listener
    @current_listener.save
    user.save
  end

	def is_logged_in
		if self.controller_name == "music_rating_services" || self.controller_name == "registrations" || self.controller_name == "sessions"
			return
		elsif @current_user == nil
			flash[:notice] = "You must be logged in to access this feature."
			redirect_to root_path
		else
			return
		end
	end

	def get_user
    return unless self.controller_name == "registrations" || self.controller_name == "sessions"
    if self.action_name == "destroy"
      @current_user = User.find_for_authentication(:id => nil)
    else
      if params[:user] == nil
        @current_user == User.find_for_authentication(:id => nil)

      else
        @current_user = User.find_for_authentication(:email => params[:user][:email])
        @current_user.save
      end
    end
	end
	
	def get_loc
    @current_user.lng = params[:lng]
    @current_user.lat = params[:lat]
  end
  
  def is_current
  	return unless self.controller_name == "users"
  	if current_user == nil
  		flash[:notice] = "You cannot access this page without being logged in to the proper account."
  		redirect_to root_path
  	elsif !current_user.is_admin
  		if params[:id] !=  current_user.id && params[:user] != current_user
  			flash[:notice] = "You cannot access this page without being logged in to the proper account."
  			redirect_to root_path
  		else
  			return
  		end
  	else
  		return
  	end
  end
  
  def merchant_guard
  	return unless self.controller_name == "merchants"
  	if current_user.nil?
  		flash[:notice] = "You must be signed into an account to access this page."
  		redirect_to root_path
  	elsif !current_user.is_admin
  		@m = Merchant.find_by_id(params[:id])
  		if @m.owner != current_user
  			flash[:notice] = "You must be signed into the proper account to access this page."
  			redirect_to user_home_path(current_user)
  		else
  			return
  		end
  	else
  		return
  	end
  end

  def rating_guard
  	return unless self.controller_name == "ratings"
  	if current_user.nil?
  		flash[:notice] = "You must be signed into an account to access this page."
  		redirect_to root_path
  	elsif !current_user.is_admin
  		flash[:notice] = "Sorry, you cannot access this page without administrator access."
  		redirect_to user_home_path(@current_user)
  	else
  		return
  	end
  end

#def after_sign_in_path_for(resource)
#  user_home_path(current_user)
#end

  protect_from_forgery
end
