class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.integer :shortenedurl_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
