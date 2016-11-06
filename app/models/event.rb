class Event < ApplicationRecord
  validates_presence_of :name

  has_many :attendees
  belongs_to :category, optional: true

  delegate :name, :to => :category, :prefix => true,
 :allow_nil => true
end
