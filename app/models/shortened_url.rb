class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, uniqueness: true
  validate :no_spamming

  has_many(
    :visits,
    class_name: 'Visit',
    primary_key: :id,
    foreign_key: :shortenedurl_id
  )

  has_many(
    :visitors,
    through: :visits,
    source: :user
  )

  has_many(
    :distinct_visitors,
    -> { distinct },
    through: :visits,
    source: :user
  )

  has_many(
    :taggings,
    class_name: 'Tagging',
    primary_key: :id,
    foreign_key: :url_id
  )

  has_many(
    :tag_topics,
    through: :taggings,
    source: :tag_topic
  )

  belongs_to(
    :submitter,
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

  def self.create_for_user_and_long_url!(long_url, user)
    self.create!(
      long_url: long_url,
      short_url: random_code, 
      user_id: user.id
    )
  end

  def num_clicks
    self.visits
        .count
  end

  def num_uniques
    self.distinct_visitors
        .count
  end

  def num_recent_uniques
    self.visits
        .select(:user_id)
        .where("created_at > ?", 10.minutes.ago)
        .distinct
        .count
  end

  def no_spamming
    last_count = ShortenedUrl.where("created_at > ?", 5.minutes.ago)
                              .where(user_id: user_id)
                              .count

    if last_count > 5
      errors.add[:maximum, "of 5 urls can be submitted in 5 minutes"]
    end
  end
end