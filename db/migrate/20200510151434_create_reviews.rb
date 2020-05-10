class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :comment, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
