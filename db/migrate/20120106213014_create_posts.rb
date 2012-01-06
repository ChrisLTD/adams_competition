class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :topic_id
      t.integeer :user_id

      t.timestamps
    end
  end
end
