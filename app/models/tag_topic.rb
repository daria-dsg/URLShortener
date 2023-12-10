class TagTopic < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  
  has_many(
    :taggings,
    class_name: 'Tagging',
    primary_key: :id,
    foreign_key: :tag_id
  )
end