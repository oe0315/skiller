class NotificationsController < ApplicationController
	before_action :authenticate_user!

	def index
		@notifications = current_user.passive_notifications
		@notifications.where(checked: false).each do |notification|
			notification.update_attributes(checked: true)
		end
	end

	def destroy_all
		Notification.destroy_all
        redirect_to notifications_path
	end
end
