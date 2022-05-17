class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = policy_scope(Place).order(created_at: :desc)
    sql_query = " \
        places.place @@ :query \
        OR places.description @@ :query \
        OR places.country @@ :query
      "
    @places = Place.where(sql_query, query: "%#{params[:query]}%") if params[:query].present?
  end

  def show
    @review = Review.new(place: @place)
    authorize @place
  end

  def new
    @place = Place.new
    authorize @place
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    authorize @place
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def edit
    authorize @place
  end

  def update
    authorize @place

    if @place.update(place_params)
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  def destroy
    authorize @place
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
