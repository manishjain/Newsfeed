class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :target_id
      t.column :target_type, "ENUM('post', 'comment')"
      t.timestamps null: false
    end
  end
end
