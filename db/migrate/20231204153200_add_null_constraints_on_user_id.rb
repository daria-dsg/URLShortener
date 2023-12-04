class AddNullConstraintsOnUserId < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:shortened_urls, :user_id, false)
  end
end
