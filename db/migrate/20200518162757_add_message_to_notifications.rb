class AddMessageToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :direct_message_id, :integer
  end
end
