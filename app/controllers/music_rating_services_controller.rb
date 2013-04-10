class MusicRatingServicesController < ApplicationController
  # GET /music_rating_services
  # GET /music_rating_services.json
  def index
   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @music_rating_services }
    end
  end
end