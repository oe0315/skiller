class UsersController < ApplicationController

	def index
		 @users = User.search(params[:search])
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.post
		@recruitment_posts = @user.recruitment_post
		# DM機能
		@current_user_entry = Entry.where(user_id: current_user.id)
		@user_entry = Entry.where(user_id: @user.id)
		if @user.id == current_user.id
		else
			@current_user_entry.each do |cu|
				@user_entry.each do |u|
					if cu.room_id == u.room_id then
						@is_room = true
						@room_id = cu.room_id
					end
				end
			end
			if @is_room
			else
				@room = Room.new
				@entry = Entry.new
			end
		end
    end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	def following
        @user = User.find(params[:user_id])
    end

    def follower
        @user = User.find(params[:user_id])
    end


	private
	def user_params
  	params.require(:user).permit(:last_name, :frist_name, :nickname, :phone_number, :skill, :second_skill, :email, :introduction, :profile_image)
    end
end

