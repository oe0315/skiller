class CreateRecruitmentPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitment_posts do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :youtube_url, null: false

      t.timestamps
    end
  end
end
