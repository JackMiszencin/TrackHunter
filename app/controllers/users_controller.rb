class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  #after_filter :get_loc, :only => :home
  #protected
  #def get_loc
  #      @current_user.lng = params[:lng]
  #      @current_user.lat = params[:lat]
  #end
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @user.lng = 5
    @user.lat = 5
    @user.save
    session[:user_id] = @user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])   
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if request.post?
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: 'User ' + session[:username] + ' was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end  
  
  def merchant_selection  
    @user = @current_user
    @merchants = Merchant.where(:lng => (@user.lng_low)..(@user.lng_up), :lat => (@user.lat_low)..(@user.lat_up))
  end

  def home
    @current_user.lng = params[:lng]
    @current_user.lat = params[:lat]
  end
end
