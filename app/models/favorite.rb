class Favorite < ApplicationRecord
	belongs_to :user

	has_many :favorite_events
	has_many :favorited_by, through: :favorite_events, source: :user
end
