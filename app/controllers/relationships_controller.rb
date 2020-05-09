class RelationshipsController < ApplicationController

	def follow
		@user = params[:id]
        current_user.follow(params[:id])
        @user.create_notification_follow(current_user)
        redirect_back(fallback_location: root_url)
	end

	def unfollow
		current_user.unfollow(params[:id])
        redirect_back(fallback_location: root_url)
	end
end
