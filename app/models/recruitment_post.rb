class RecruitmentPost < ApplicationRecord
	belongs_to :user

	def self.search(search)
      return RecruitmentPost.all unless search
      RecruitmentPost.where(['title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"])
    end
end
