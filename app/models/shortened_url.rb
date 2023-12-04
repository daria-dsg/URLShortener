class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, uniqueness: true
  validates :user_id, uniqueness: true

  belongs_to(
    :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id
  )

  def self.random_code
    short_url = SecureRandom::urlsafe_base64[0,5]

    while ShortenedUrl.exists?(:short_url => "str")
      short_url = SecureRandom::urlsafe_base64[0,5]
    end

    "https://shorturl.at/" + short_url
  end
end