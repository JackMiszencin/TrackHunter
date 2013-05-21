require "json"
require "open-uri"
class MerchantsController < ApplicationController

  # Only shows businesses owned by a user, if they are amerchant. If the user is an admin, it shows all
  # merchants in the database
  def index
    if current_user.is_admin
      @merchants = Merchant.all
    elsif current_user.businesses != nil
      @merchants = current_user.businesses
    else
      @merchants = []
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @merchants }
    end
  end

  def show
    @merchant = Merchant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @merchant }
    end
  end

  def new
    @merchant = Merchant.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @merchant }
    end
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  # Assigns latitude and longitude variables to the merchant using the provided address and the Google Maps Geocoding API
  def create
    @merchant = Merchant.new(params[:merchant])
    @merchant.owner_id = current_user.id
    @merchant.get_coor # References method to pull coordinates from Google Maps Geocoding API

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: 'Merchant was successfully created.' }
        format.json { render json: @merchant, status: :created, location: @merchant }
      else
        format.html { render action: "new" }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @merchant = Merchant.find(params[:id])
    @merchant.get_coor # References method to pull coordinates from Google Maps Geocoding API.

    respond_to do |format|
      if @merchant.update_attributes(params[:merchant])
        format.html { redirect_to @merchant, notice: 'Merchant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @merchant = Merchant.find(params[:id])
    @merchant.destroy

    respond_to do |format|
      format.html { redirect_to merchants_url }
      format.json { head :no_content }
    end
  end
end
