class AddIndexToUrlIdInTAggings < ActiveRecord::Migration[7.1]
  def change
    add_index :taggings, [:url_id, :tag_id], unique: true
  end
end
