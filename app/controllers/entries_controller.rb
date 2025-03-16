class EntriesController < ApplicationController
  def new
    if @current_user
      @place = Place.find_by({ "id" => params["place_id"] })
    else
      redirect_to "/sessions/new"
    end
  end

  def create
    if @current_user
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = params["place_id"]
      @entry["user_id"] = @current_user["id"]
      
      # Handle file upload
      if params["image"]
        @entry.image.attach(params["image"])
      end
      
      @entry.save
      redirect_to "/places/#{@entry["place_id"]}"
    else
      redirect_to "/sessions/new"
    end
  end
end
