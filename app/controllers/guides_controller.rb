class GuidesController < ApplicationController
  before_action :set_place, only: [:new, :create]
  before_action :set_guide, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @guides = Guide.all
  end

  def show
    @guide.place = @place
    @review = Review.new(guide: @guide)
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
    @guide.place_id = @place.id

    if @guide.save
      redirect_to guide_path(@guide)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @guide.update(guide_params)
      redirect_to guide_path(@guide)
    else
      render :edit
    end
  end

  def destroy
    @guide.destroy

    redirect_to guides_path
  end

  private

  def guide_params
    params.require(:guide).permit(:first_name, :last_name, :phone_number, :guide_name, :dni, :email, :date_of_birth, :country, :city, :age, :photo)
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_guide
    @guide = Guide.find(params[:id])
  end
end
