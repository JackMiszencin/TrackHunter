class RatingsController < ApplicationController
  # If the user is an admin, it shows all ratings in the database. If they are a business owner, it shows both
  # their ratings as a listener and the ratings their businesses have received. If neither is the case, it just
  # shows the ratings the user has made as a listener. Part of this is played out in the view.
  def index
    if @current_user.is_admin
      @ratings = Array.new
      @ratings = Rating.all
    elsif @current_user.is_merchant
      @merchant_ratings = Array.new
      @links = Rating.all
      @links.each do |r|
        if r.owner == @current_user
          @merchant_ratings << r
        end
      end
    else
    end
    @user_ratings = Array.new
    @links = Rating.all
    @links.each do |r|
      if r.user == @current_user
        @user_ratings << r
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ratings }
    end
  end

  def show
    @rating = Rating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rating }
    end
  end

  # This page is the one after a location and current_merchant have been discerned (see listeners controller),
  # where the user selects a simple like/dislike attribute for a rating.
  def new
    @rating = Rating.new
    @listener = current_user.listener
    @merchant = @listener.merchant
    @song = @merchant.current_song

    if request.post?
      @song.ratings << @rating
      @rating.song = @song
      @merchant.ratings << @rating
      @rating.merchant = @merchant
      @rating.like = params[:like]
      @rating.save
      @listener.ratings << @rating
      redirect_to @rating
    end
  end

  # THIS VIEW NOT YET CREATED
  def edit
    @rating = Rating.find(params[:id])
  end

  def create
    @rating = Rating.new(params[:rating])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render json: @rating, status: :created, location: @rating }
      else
        format.html { render action: "new" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @rating = Rating.find(params[:id])

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to ratings_url }
      format.json { head :no_content }
    end
  end
end
