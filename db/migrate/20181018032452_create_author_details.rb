class CreateAuthorDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :author_details do |t|
      t.integer :author_id
      t.integer :book_id

      t.timestamps
    end
  end
end
