class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
    sql_query = " \
        places.place @@ :query \
        OR places.description @@ :query \
        OR places.country @@ :query
      "
    @places = Place.where(sql_query, query: "%#{params[:query]}%") if params[:query].present?
  end

  def show
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

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  def destroy
    @place.destroy

    redirect_to places_path
  end

  private

  def place_params
    params.require(:place).permit(:place, :country, :description, :rating, :photo)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
