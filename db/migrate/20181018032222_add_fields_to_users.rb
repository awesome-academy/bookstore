class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :dob, :datetime
    add_column :users, :avatar, :string
    add_column :users, :payment_id, :integer
  end
end
