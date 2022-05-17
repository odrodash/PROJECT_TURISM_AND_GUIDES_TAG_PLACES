class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @place = Place.find(params[:place_id])
    @review.place = @place
    @review.user_id = current_user.id
    authorize @review

    if @review.save
      redirect_to place_path(@place, anchor: "review-#{@review.id}")
    else
      render 'places/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review

    @review.destroy
    redirect_to place_path(@review.place, anchor: "reviews")
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
