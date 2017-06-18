class Event < ApplicationRecord
  validates :user_id, presence: true
  validates :event_type, presence: true

  enum event_type: [:eat, :play]
end