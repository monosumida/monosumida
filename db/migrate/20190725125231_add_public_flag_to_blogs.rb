class AddPublicFlagToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :public_flag, :bool, after: :title
  end
end
