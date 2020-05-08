class Room < ApplicationRecord
	has_many :direct_messages, dependent: :destroy
    has_many :entries, dependent: :destroy
    has_many :users, through: :entries
end
