class HomeController < ApplicationController
  def top
    @recruitment_posts = RecruitmentPost.all
  end

  def about
  end
end
