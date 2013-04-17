class RatingsController < ApplicationController
  # GET /ratings
  # GET /ratings.json
  def index
    if @current_user.is_admin
      @ratings = Array.new
      @ratings = Rating.all
    elsif @current_user.is_merchant
      @ratings = Array.new
      @links = Rating.all
      @links.each do |r|
        if r.owner == @current_user
          @ratings << r
        end
      end
    else
      @ratings = Array.new
      @links = Rating.all
      @links.each do |r|
        if r.user == @current_user
          @ratings << r
        end
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ratings }
    end
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    @rating = Rating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.json
  def new
    @rating = Rating.new
    @merchant = @current_user.merchant
    @song = @merchant.current_song

    if request.post?
      @song.ratings << @rating
      @rating.song = @song
      @merchant.ratings << @rating
      @rating.merchant = @merchant
      @rating.like = params[:like]
      @rating.save
      @current_user.ratings << @rating
      redirect_to @rating
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.json
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

  # PUT /ratings/1
  # PUT /ratings/1.json
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

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to ratings_url }
      format.json { head :no_content }
    end
  end
end
