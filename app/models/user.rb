class User < ApplicationRecord
	has_many :post
	has_many :recruitment_post
	has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
    has_many :follower_user, through: :followed, source: :follower # 自分がフォローされている人
	mount_uploader :profile_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def self.search(search)
      return User.all unless search
      User.where(['nickname LIKE ?', "%#{search}%"])
    end

	def follow(user_id)
	  follower.create(followed_id: user_id)
	end

	def unfollow(user_id)
	  follower.find_by(followed_id: user_id).destroy
	end

	def following?(user)
	  following_user.include?(user)
	end
end
