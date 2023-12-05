class Visit < ApplicationRecord
  validates :shortenedurl_id, presence: true
  validates :user_id, presence: true
end