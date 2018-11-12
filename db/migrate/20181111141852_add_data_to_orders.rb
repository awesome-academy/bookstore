class AddDataToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :name, :string
    add_column :orders, :dob, :string
    add_column :orders, :payment_id, :integer
  end
end
