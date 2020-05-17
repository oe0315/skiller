class RecruitmentPostsController < ApplicationController
	before_action :authenticate_user!

	def index
		@recruitment_post = RecruitmentPost.new
		@recruitment_posts = RecruitmentPost.search(params[:search]).page(params[:page]).per(10)
	end

	def create
		@recruitment_post = RecruitmentPost.new(recruitment_post_params)
		url = params[:recruitment_post][:youtube_url]
        url = url.last(11)
        @recruitment_post.youtube_url = url
        @recruitment_post.user_id = current_user.id
		@recruitment_post.save
		redirect_to recruitment_posts_path
	end

	def edit
		@recruitment_post = RecruitmentPost.find(params[:id])
	end

	def update
		@recruitment_post = RecruitmentPost.find(params[:id])
		url = params[:recruitment_post][:youtube_url]
        url = url.last(11)
        @recruitment_post.youtube_url = url
		@recruitment_post.update(recruitment_post_params)
		redirect_to user_path(@recruitment_post.user_id)
	end

	def destroy
		@recruitment_post = RecruitmentPost.find(params[:id])
  	    @recruitment_post.destroy
  	    redirect_to user_path(@recruitment_post.user_id)
	end

	private
    def recruitment_post_params
    	params.require(:recruitment_post).permit(:title, :body, :youtube_url)
    end
end
