class User < ApplicationRecord
  has_many :hosted_events, foreign_key: "host_id", class_name: "Event"
  has_many :event_registrations, foreign_key: :attendee_id
  has_many :attended_events, through: :event_registrations, source: :event
end
