class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.float :price
      t.integer :quantity_in_store
      t.string :image
      t.text :description
      t.integer :category_id
      t.timestamps
    end
  end
end
