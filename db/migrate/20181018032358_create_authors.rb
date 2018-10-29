class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.datetime :birthday
      t.timestamps
    end
  end
end
