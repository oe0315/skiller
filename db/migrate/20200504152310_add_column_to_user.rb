class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile_image, :string
    add_column :users, :skill, :string
    add_column :users, :introduction, :string
    add_column :users, :phone_number, :string
  end
end
