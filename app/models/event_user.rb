class EventUser < ApplicationRecord
  has_one :event_place
  belongs_to :user

  validates :user_id, presence: true
  validates :event_place_id, presence: true
  validates :count, presence: true
  validates :expiration, presence: true
end