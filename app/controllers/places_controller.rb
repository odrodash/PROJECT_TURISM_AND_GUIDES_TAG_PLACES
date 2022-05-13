class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @places = Place.all
    if params[:query].present?
      sql_query = " \
        places.place @@ :query \
        OR places.description @@ :query \
        OR places.country @@ :query
      "
      @places = Place.where(sql_query, query: "%#{params[:query]}%")
    end
  end

  def show
    @place = Place.find(params[:id])
    @review = Review.new(place: @place)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:place, :country, :description, :rating, :photo)
  end
end
