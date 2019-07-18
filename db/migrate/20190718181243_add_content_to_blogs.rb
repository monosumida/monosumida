class AddContentToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :content, :text
  end
end
