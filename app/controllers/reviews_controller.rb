class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @place = Place.find(params[:place_id])
    @review.place = @place
    if @review.save
      redirect_to place_path(@place)
    else
      render 'places/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.place)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
