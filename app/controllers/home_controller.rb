class HomeController < ApplicationController

	def top
		@recruitment_posts = RecruitmentPost.limit(6)
	end

	def about
	end

end
