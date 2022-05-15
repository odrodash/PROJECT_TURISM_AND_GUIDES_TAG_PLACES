class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @place = Place.find(params[:place_id])
    @review.place = @place
    if @review.save
      redirect_to place_path(@place, anchor: "review-#{@review.id}")
    else
      render 'places/show'
    end
  end

  def creation
    @review = Review.new(review_params)
    @guide = Guide.find(params[:guide_id])
    @review.guide = @guide
    if @review.save
      redirect_to guide_path(@guide, anchor: "review-#{@review.id}")
    else
      render "guides/show"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to place_path(@review.place, anchor: "reviews")
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
