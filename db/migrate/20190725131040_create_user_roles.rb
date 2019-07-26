class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.integer :user_id, foreign_key: true
      t.integer :role_id, foreign_key: true

      t.timestamps
    end
  end
end
