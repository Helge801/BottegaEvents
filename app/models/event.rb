class Event < ApplicationRecord

	belongs_to :user

  mount_uploader :image, EventUploader
  mount_uploader :thumb_image, EventUploader
end
