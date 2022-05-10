class GuidesController < ApplicationController
  before_action :set_place, only: [:show, :new, :create]

  def index
    @guides = Guide.all
  end

  def show
    @guide = Guide.find(params[:id])
    @guide.place = @place
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
    @guide.place = @place
    if @guide.save
      redirect_to guide_path(@guide)
    else
      render :new
    end
  end

  def destroy
    @guide = Guide.find(params[:id])
    @guide.destroy

    redirect_to guides_path
  end

  private

  def guide_params
    params.require(:guide).permit(:first_name, :last_name, :phone_number, :guide_name, :dni, :email, :date_of_birth, :country, :city, :age)
  end

  def set_place
    @place = Place.find(params[:place_id])
  end
end
