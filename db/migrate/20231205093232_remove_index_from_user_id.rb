class RemoveIndexFromUserId < ActiveRecord::Migration[7.1]
  def change
    remove_index :shortened_urls, :user_id
  end
end
