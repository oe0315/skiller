class DirectMessage < ApplicationRecord
	belongs_to :user
    belongs_to :room
    has_many :notifications, dependent: :destroy
    validates :message, presence: true


    def create_notification_direct_message(current_user, visited_user)
        notification = current_user.active_notifications.new(
          visited_id: visited_user[0].id,
          action: 'direct_message'
        )
        # 自分の場合は、通知済みとする
        if notification.visitor_id == notification.visited_id
            notification.checked = true
        end
            notification.save if notification.valid?
    end
end
