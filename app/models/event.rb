class Event < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :event_registrations, foreign_key: :event_id
  has_many :attendees, through: :event_registrations, source: :attendee

  scope :upcoming, -> { where('date >= ?', Date.today)}
  scope :previous, -> { where('date < ?', Date.today)}
end
