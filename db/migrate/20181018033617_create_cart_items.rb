class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.float :paideach
      t.integer :cart_id
      t.integer :book_id

      t.timestamps
    end
  end
end
