class ListenersController < ApplicationController
	def show
    @listener = Listener.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listener }
    end
  end

  def new
    @listener = Listener.new
    @listener.lng = 0
    @listener.lat = 0
    @listener.save

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listener }
    end
  end

  # GET /users/1/edit
  def edit
    @listener = Listener.find(params[:id])   
    
  end

  # POST /users
  # POST /users.json
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


  # PUT /users/1
  # PUT /users/1.json
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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @listener = Listener.find(params[:id])
    @listener.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end  
  
  def merchant_selection  
    @listener = @current_user.listener
    @merchants = Merchant.where(:lng => (@listener.lng_low)..(@listener.lng_up), :lat => (@listener.lat_low)..(@listener.lat_up))
  end

  def home
  	@listener = @current_user.listener
  	@listener.lng = params[:lng]
  	@listener.lat = params[:lat]
  end

end