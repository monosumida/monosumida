class AddUserToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :user, foreign_key: true, index: true, after: :id
  end
end
