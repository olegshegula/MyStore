class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.integer :commentable_id
      t.integer :commentable_type #Item, BlogPost
      t.timestamps
    end
  end
end
