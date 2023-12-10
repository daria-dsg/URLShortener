class CreateTaggings < ActiveRecord::Migration[7.1]
  def change
    create_table :taggings do |t|
      t.integer :tag_id, null:false
      t.integer :url_id, null:false 
      t.timestamps
    end
  end
end
