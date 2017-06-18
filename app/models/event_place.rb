class EventPlace < ApplicationRecord
  validates :title, presence: true
  validates :floor, presence: true
  validates :places_count, presence: true

  enum enjoy_type: [:eat, :play]
end