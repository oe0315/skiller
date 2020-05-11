class AddReviewedToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :reviewing_user_id, :integer
  end
end
