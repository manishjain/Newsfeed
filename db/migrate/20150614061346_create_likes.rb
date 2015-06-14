class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :target_id
      t.column :target_type, "ENUM('post', 'comment')"
      t.timestamps null: false
    end
  end
end
