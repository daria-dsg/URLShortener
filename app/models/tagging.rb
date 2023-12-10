class Tagging < ApplicationRecord
  validates :tag_id, presence: true
  validates :url_id, presence: true
end