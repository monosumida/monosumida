class AddUserToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :user_id, :integer, foreign_key: true, index: true, after: :id
  end
end
