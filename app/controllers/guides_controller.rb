class GuidesController < ApplicationController
  before_action :set_place, only: [:new, :create]
  before_action :set_guide, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @guides = policy_scope(Guide).order(created_at: :desc)
  end

  def show
    @guide.place = @place
    @review_guide = ReviewGuide.new(guide: @guide)
    authorize @guide
  end

  def new
    @guide = Guide.new
    authorize @guide
  end

  def create
    @guide = Guide.new(guide_params)
    @guide.place_id = @place.id
    @guide.user_id = current_user.id

    authorize @guide

    if @guide.save
      redirect_to guide_path(@guide)
    else
      render :new
    end
  end

  def edit
    authorize @guide
  end

  def update
    authorize @guide
    if @guide.update(guide_params)
      redirect_to guide_path(@guide)
    else
      render :edit
    end
  end

  def destroy
    authorize @guide
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
