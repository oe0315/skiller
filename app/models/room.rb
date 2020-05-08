class Room < ApplicationRecord
	has_many :direct_messages, dependent: :destroy
    has_many :entries, dependent: :destroy
end
