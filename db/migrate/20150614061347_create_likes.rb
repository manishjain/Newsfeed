class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :target_id
      t.column :target_type, "ENUM('post', 'comment')"
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
