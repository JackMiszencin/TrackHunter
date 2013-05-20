class ListenersController < ApplicationController # The listener serves as a place-holder to represent the user
  # in matters of creating ratings, both to distinguish from the user's role as merchant and listener
  # and to prevent issues encountered when altering devise's controllers.
	def show
    @listener = Listener.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listener }
    end
  end

  def new
    @listener = Listener.new
    @listener.save

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listener }
    end
  end

  # THIS PAGE NOT YET CREATED/FUNCTIONAL
  def edit
    @listener = Listener.find(params[:id])   
    
  end

  def create
    @listener = Listener.new(params[:listener])
    if request.post?
      respond_to do |format|
        if @user.save
          format.html { redirect_to @listener, notice: 'Listener was successfully created.' }
          format.json { render json: @listener, status: :created, location: @listener }
        else
          format.html { render action: "new" }
          format.json { render json: @listener.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # Works for three different methods. Each has a parameter embedded in its form that allows this controller to discern
  # how to update the listener and where to redirect the user.
  def update
    @listener = @current_user.listener
    if params[:location]
      respond_to do |format|
	      if @listener.update_attributes(params[:listener])
	        format.html {redirect_to merchant_selection_user_listener_path(@current_user)}
	        format.json {head :no_content}
	      else
	      end
	    end
    elsif params[:updated_store]  
      respond_to do |format|
        if @listener.update_attributes(params[:listener])
          format.html { redirect_to new_rating_path, notice:'Current merchant successfully updated.' }
          format.json { head :no_content }
        else
        end 
      end
    else    
      respond_to do |format|
        if @listener.update_attributes(params[:listener])
          format.html { redirect_to home_user_listener_path(@current_user), notice: 'Listener was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @listener.errors, status: :unprocessable_entity }
        end 
      end
    end
  end

  def destroy
    @listener = Listener.find(params[:id])
    @listener.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end  
  
  # @merchants returns those merchants close to the user based on geolocation.
  def merchant_selection  
    @listener = @current_user.listener
    @merchants = Merchant.where(:lng => (@listener.lng_low)..(@listener.lng_up), :lat => (@listener.lat_low)..(@listener.lat_up))
  end

  # This page is used as the stage for the user opting to have HTML5's geolocation feature give them their current location.
  def home
  	@listener = @current_user.listener
  	@listener.lng = params[:lng]
  	@listener.lat = params[:lat]
  end

end