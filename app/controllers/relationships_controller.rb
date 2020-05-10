class RelationshipsController < ApplicationController

	def follow
        @follow = current_user.follow(params[:id])
        @user = User.find(@follow.follower_id)
        @user.create_notification_follow!(current_user)
        redirect_back(fallback_location: root_url)
	end

	def unfollow
		current_user.unfollow(params[:id])
        redirect_back(fallback_location: root_url)
	end
end
