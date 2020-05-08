class AddStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :valid_status, :integer, default: 0
  end
end
