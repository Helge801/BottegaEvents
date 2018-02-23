class Event < ApplicationRecord


  validates :title, presence: true


  enum status: {pending: 0, approved: 1, rejected: 2}

  belongs_to :user

  has_many :favorite_events
  has_many :favorited_by, through: :favorite_events, source: :user
  
  has_many :rsvp_events
  has_many :rsvped_by, through: :rsvp_events, source: :user


  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
  
end
