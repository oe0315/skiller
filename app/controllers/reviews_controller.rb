class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @review = Review.new
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.reviewing_user_id = current_user.id
    @review.score = Language.get_data(review_params[:comment])
    @review.save
    redirect_to user_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :comment, :rate, :user_id, :reviewing_user_id)
    end
end
