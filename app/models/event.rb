class Event < ApplicationRecord
  enum status: {pending: 0, approved: 1, rejected: 2}
	belongs_to :user

  mount_uploader :image, EventUploader
  mount_uploader :thumb_image, EventUploader
end
