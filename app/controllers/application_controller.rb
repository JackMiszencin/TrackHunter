class ApplicationController < ActionController::Base
	before_filter :is_current, :only => [:destroy, :index, :edit]
	before_filter :merchant_guard, :only => [:edit, :destroy]
	before_filter :is_logged_in, :except => [:new, :create]
	before_filter :songs_filter
	before_filter :rating_guard, :only => [:edit, :destroy]
  before_filter :create_listener, :only => :create
  after_filter :set_listener, :only => :create
  before_filter :required_fields, :only => :create

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
  end
  
  def set_listener
    return unless self.controller_name == "registrations"
    user = User.find_for_authentication(:email => params[:user][:email])
    @listener.user_id = user.id
    user.listener = @listener
    @listener.save
    user.save
  end

	def is_logged_in
		if self.controller_name == "music_rating_services" || self.controller_name == "registrations" || self.controller_name == "sessions"
			return
		elsif User.find_for_authentication(:id => current_user.id) == nil
			flash[:notice] = "You must be logged in to access this feature."
			redirect_to root_path
		else
			return
		end
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
  		redirect_to user_home_path(current_user)
  	else
  		return
  	end
  end

  def required_fields
    if self.controller_name == "registrations"
      param_name = "user"
    elsif self.controller_name == "merchants"
      param_name = "merchant"
    else
      return
    end
    empty_fields = Array.new
    empty = false
    params[param_name].each_pair do |k, v|
      if v == ""
        empty_fields << k.gsub("_", " ")
        empty = true
      end
    end
    if empty == true
      (0..empty_fields.length - 3).each do |i|
        empty_fields[i] << ","
      end
      empty_fields.insert(-2, "and") unless empty_fields.length < 2
      field_list = empty_fields.join(" ")
      message = "You cannot leave empty fields. The field" 
      if empty_fields.length > 1
        message << "s "
      else
        message << " "
      end
      message << field_list 
      if empty_fields.length > 1
        message << " were left blank."
      else
        message << " was left blank."
      end
      flash[:notice] = message
      redirect_to request.referrer
    else
      return
    end
  end

  def after_sign_in_path_for(resource)
    user_root_path(resource)
  end

  protect_from_forgery
end
