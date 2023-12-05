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

  def self.create!(long_url, user)
    self.new(long_url: long_url, short_url: random_code, user_id: user.id).save!
  end

end