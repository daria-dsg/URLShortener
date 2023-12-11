class TagTopic < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  
  has_many(
    :taggings,
    class_name: 'Tagging',
    primary_key: :id,
    foreign_key: :tag_id
  )

  has_many(
    :urls,
    through: :taggings,
    source: :url
  )

  def popular_links
    urls.joins(:visits)
    .group(:short_url, :long_url)
    .order('COUNT(visits.id) DESC')
    .select('long_url, short_url, COUNT(visits.id) as number_of_visits')
    .limit(5)
  end
end