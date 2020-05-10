class ReviewsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@review = Review.new
		@reviews = Review.all
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.save
		redirect_to user_reviews_path
	end

	private
	def review_params
  	params.require(:review).permit(:title, :comment)
    end
end
