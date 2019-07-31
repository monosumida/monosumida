class CreateBlogCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_categories do |t|
      t.references :blog, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
