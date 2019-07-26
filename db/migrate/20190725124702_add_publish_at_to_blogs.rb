class AddPublishAtToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :publish_at, :datetime, after: :updated_at
  end
end
