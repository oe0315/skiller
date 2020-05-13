class PostsController < ApplicationController

	def index
		@post = Post.new
		@posts = Post.search(params[:search])
	end

	def create
		@post = Post.new(post_params)
		url = params[:post][:youtube_url]
        url = url.last(11)
        @post.youtube_url = url
        @post.user_id = current_user.id
		@post.save
		redirect_to posts_path
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		url = params[:post][:youtube_url]
        url = url.last(11)
        @post.youtube_url = url
		@post.update(post_params)
		redirect_to user_path(@post.user_id)
	end

	def destroy
		@post = Post.find(params[:id])
  	    @post.destroy
  	    redirect_to user_path(@post.user_id)
	end

  private
    def post_params
    	params.require(:post).permit(:body, :youtube_url)
    end
end
