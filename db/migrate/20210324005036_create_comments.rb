class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :post_id,index:true
      t.text :body ,null:false
      t.datetime :created_at
    end
    add_foreign_key :comments , :posts
  end
end
