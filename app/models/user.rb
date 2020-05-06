class User < ApplicationRecord
	has_many :post
	has_many :recruitment_post
	mount_uploader :profile_image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def self.search(search)
      return User.all unless search
      User.where(['nickname LIKE ?', "%#{search}%"])
    end
end
