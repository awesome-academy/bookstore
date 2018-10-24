class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :phone_number
      t.string :address
      t.float :total
      t.datetime :date
      t.integer :cart_id
      t.integer :user_id

      t.timestamps
    end
  end
end
