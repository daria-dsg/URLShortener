class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  has_many(
    :submitted_urls,
    class_name: 'ShortenedUrl',
    primary_key: :id,
    foreign_key: :user_id
  )
end