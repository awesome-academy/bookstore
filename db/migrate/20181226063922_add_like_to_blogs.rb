class AddLikeToBlogs < ActiveRecord::Migration[5.2]
  def change
     add_column :blogs, :like, :integer, default: 0
  end
end
