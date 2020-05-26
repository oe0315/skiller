class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.search(params[:search])
    @search = params[:search]
    end
end
