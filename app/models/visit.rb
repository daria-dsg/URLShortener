class Visit < ApplicationRecord
  validates :shortenedurl_id, presence: true
  validates :user_id, presence: true

  belongs_to(
    :shortened_url,
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :shortenedurl_id
  )

  belongs_to(
    :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id
  )

  def self.record_visit!(shortened_url, user)
    Visit.create!(
      shortenedurl_id: shortened_url.id,
      user_id: user.id
    )
  end
end