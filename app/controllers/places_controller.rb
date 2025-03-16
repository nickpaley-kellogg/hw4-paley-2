class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    if @current_user
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] })
    else
      redirect_to "/sessions/new"
    end
  end

  def new
    if !@current_user
      redirect_to "/sessions/new"
    end
  end

  def create
    if @current_user
      @place = Place.new
      @place["name"] = params["name"]
      @place.save
      redirect_to "/places"
    else
      redirect_to "/sessions/new"
    end
  end
end