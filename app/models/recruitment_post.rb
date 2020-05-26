class RecruitmentPost < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 50 }
  validates :youtube_url, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def self.search(search)
    return RecruitmentPost.all unless search
    RecruitmentPost.where(['title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"])
    end
end
