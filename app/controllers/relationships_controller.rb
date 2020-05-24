class RelationshipsController < ApplicationController
        before_action :authenticate_user!

        def follow
            @follow = current_user.follow(params[:id])
            @followed_user = User.find(@follow.followed_id)
            @followed_user.create_notification_follow!(current_user)
            redirect_back(fallback_location: root_url)
	end

	def unfollow
	    current_user.unfollow(params[:id])
            redirect_back(fallback_location: root_url)
	end
end
