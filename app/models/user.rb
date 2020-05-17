class User < ApplicationRecord
 has_many :reviews, dependent: :destroy
 belongs_to :reviewing, class_name: "Review", optional: true
 has_many :post, dependent: :destroy
 has_many :recruitment_post, dependent: :destroy
 has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
 has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
 has_many :following_user, through: :follower, source: :followed, dependent: :destroy # 自分がフォローしている人
 has_many :follower_user, through: :followed, source: :follower, dependent: :destroy # 自分がフォローされている人
 has_many :direct_messages, dependent: :destroy
 has_many :entries, dependent: :destroy
 has_many :rooms, through: :entries
 has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
 has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
 mount_uploader :profile_image, ImageUploader

 validates :last_name,length: {maximum: 10, minimum: 1}
 validates :frist_name,length: {maximum: 10, minimum: 1}
 validates :nickname,length: {maximum: 20, minimum: 2}
 validates :skill,length: {maximum: 20, minimum: 2}
 validates :second_skill,length: {maximum: 20}



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  def self.search(search)
    return User.all unless search
    User.where(['nickname LIKE ? OR skill LIKE ? OR second_skill LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
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

	def follower?(user)
	  follower_user.include?(user)
	end

	def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])# すでにフォローされているか検索
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

end