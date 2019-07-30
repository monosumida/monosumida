class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :user_id, foreign_key: true, index: true
      t.string :title
      t.text :content
      t.boolean :public_flag

      t.timestamps
    end
  end
end
