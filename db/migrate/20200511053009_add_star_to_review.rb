class AddStarToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :rate, :float, null: false, default: 0
  end
end
