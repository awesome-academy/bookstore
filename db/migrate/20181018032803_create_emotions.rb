class CreateEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :emotions do |t|
      t.boolean :like
      t.boolean :dislike
      t.integer :user_id
      t.integer :book_id
      t.timestamps
    end
  end
end
