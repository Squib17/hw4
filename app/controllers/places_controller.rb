class PlacesController < ApplicationController

  def index
    @user = User.find_by({"id" => session["user_id"]})
    if @user !=nil
      @places = Place.where({"id" => session["user_id"]})
    else
      redirect_to "/login"
    end
  end

  def show
    @user = User.find_by({"id" => session["user_id"]})
    if @user !=nil
      @place = Place.find_by({ "id" => params["id"] })
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"] })
    else
      redirect_to "/login"
    end
  end

  def new
    @user = User.find_by("id" => session["user_id"])
    if @user == nil
      redirect_to "/login"
    end
  end

  def create
    @user = User.find_by({"id" => session["user_id"]})
    if @user !=nil
      @place = Place.new
      @place["name"] = params["name"]
      @place[]
      @place.save
      redirect_to "/places"
    else
      redirect_to "/login"
    end
  end

end
