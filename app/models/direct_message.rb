class DirectMessage < ApplicationRecord
	belongs_to :user
    belongs_to :room
    validates :massage, presence: true
end
