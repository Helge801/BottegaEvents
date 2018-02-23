class Event < ApplicationRecord


  validates :title, presence: true


  enum status: {pending: 0, approved: 1, rejected: 2}

	belongs_to :user


  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
  
end
