class Post < ApplicationRecord
	belongs_to :user
	validates :youtube_url, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def self.search(search)
      return Post.all unless search
      Post.where(['body LIKE ?', "%#{search}%"])
    end

end
