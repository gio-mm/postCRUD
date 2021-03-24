class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text  :body
      t.boolean :mark_for_deletion,:default => false
      t.datetime :created_at
    end
  end
end
