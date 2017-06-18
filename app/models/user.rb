class User < ApplicationRecord
  has_many :event_users

  validates :telegram_id, presence: true, uniqueness: true
end