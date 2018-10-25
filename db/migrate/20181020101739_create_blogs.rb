class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :author
      t.string :date
      t.string :description
      t.string :auth_link
      t.timestamps
      t.text   :body
      t.timestamps
    end
    add_index :blogs, [:user_id, :created_at]
  end
end
