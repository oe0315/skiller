class Review < ApplicationRecord
  belongs_to :user
  has_one :reviewings, class_name: "User", foreign_key: :id, primary_key: :reviewing_user_id
  validates :rate, presence: true, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :comment, presence: true, length: { maximum: 200 }
end
