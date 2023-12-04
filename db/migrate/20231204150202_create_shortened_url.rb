class CreateShortenedUrl < ActiveRecord::Migration[7.1]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false
      t.string :short_url
      t.integer :user_id
      t.timestamps
    end

    add_index :shortened_urls, :short_url, unique: true
    add_index :shortened_urls, :user_id, unique: true
  end
end
