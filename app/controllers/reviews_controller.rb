class ReviewsController < ApplicationController

  def new
    @hen = Hen.find(params[:hen_id])
    @user = @hen.user.id
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(reviews_params)
    @hen = Hen.find(params[:hen_id])
    @user = @hen.user_id

    @review.hen = @hen
      @review.save
      authorize @review
      if @review.save
        redirect_to dashboard_path
      else
        render :new
      end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating, :hen_id, :user_id)
  end

end
