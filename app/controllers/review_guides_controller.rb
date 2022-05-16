class ReviewGuidesController < ApplicationController
  def create
    @review_guide = ReviewGuide.new(review_params)
    @guide = Guide.find(params[:guide_id])
    @review_guide.guide = @guide
    if @review_guide.save
      redirect_to guide_path(@guide, anchor: "review-guide-#{@review_guide.id}")
    else
      render 'guides/show'
    end
  end

  def destroy
    @review_guide = ReviewGuide.find(params[:id])
    @review_guide.destroy

    redirect_to guide_path(@review_guide.guide, anchor: "reviews-guide")
  end

  private

  def review_params
    params.require(:review_guide).permit(:comment, :rating)
  end
end
