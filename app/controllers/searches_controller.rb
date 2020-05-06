class SearchesController < ApplicationController

	def index
	    @posts = Post.search(params[:search])
	    @search = params[:search]
    end

end
