class Event < ApplicationRecord
  validates_presence_of :name

  has_many :attendees
  belongs_to :category, optional: true
  has_one :location

  has_many :event_groupships
  has_many :groups, :through => :event_groupships
end
