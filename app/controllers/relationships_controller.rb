class RelationshipsController < ApplicationController

	def follow
        current_user.follow(params[:id])
        redirect_back(fallback_location: root_url)
	end

	def unfollow
		current_user.unfollow(params[:id])
        redirect_back(fallback_location: root_url)
	end
end
