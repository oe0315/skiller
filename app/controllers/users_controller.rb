class UsersController < ApplicationController

	def index
		 @users = User.search(params[:search])
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.post
		@recruitment_posts = @user.recruitment_post
    end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	def withdraw
		
	end

	def cancel
		
	end

	private
	def user_params
  	params.require(:user).permit(:last_name, :frist_name, :nickname, :phone_number, :skill, :second_skill, :email, :introduction, :profile_image)
    end
end
