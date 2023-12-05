class Visit < ApplicationRecord
  validates :shortenedurl_id, presence: true
  validates :user_id, presence: true

  def self.record_visit!(shortened_url, user)
    Visit.create!(
      shortenedurl_id: shortened_url.id,
      user_id: user.id
    )
  end
end