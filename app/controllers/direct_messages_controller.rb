class DirectMessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:direct_message][:room_id]).present?
      @direct_message = DirectMessage.create(message_params)
      @room = Room.find(@direct_message.room_id)
      visited_user = @room.users.where.not(id: current_user)
      @direct_message.create_notification_direct_message(current_user, visited_user)
      redirect_to room_path(@direct_message.room_id)
    else
      redirect_back(fallback_location: root_path)
      end
  end

  private

  def message_params
    params.require(:direct_message).permit(:user_id, :message, :room_id).merge(:user_id => current_user.id)
  end
end
