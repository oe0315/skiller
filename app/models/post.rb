class Post < ApplicationRecord
	belongs_to :user
	validates :youtube_url, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
