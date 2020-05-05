class PostsController < ApplicationController

	def index
		@post = Post.new
		@posts = Post.all
	end

	def create
		@post = Post.new(post_params)
		url = params[:post][:youtube_url]
        url = url.last(11)
        @post.youtube_url = url
		@post.save
		redirect_to posts_path
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

  private
    def post_params
    	params.require(:post).permit(:body, :youtube_url)
    end
end
