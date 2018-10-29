class CreateEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :emotions do |t|
      t.boolean :like
      t.boolean :dislike
      t.integer :user_id
      t.integer :book_id
      t.timestamps
    end
    add_index :emotions, :user_id
    add_index :emotions, :book_id
    add_index :emotions, [:user_id, :book_id], unique: true
  end
end
