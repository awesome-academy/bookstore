class ChangeEmotionsData < ActiveRecord::Migration[5.2]
  def change
    remove_column :emotions, :like
    remove_column :emotions, :like
    rename_column :emotions, :book_id, :recipent_id
    add_column :emotions, :recipent_type, :string
    add_index :emotions, [:user_id, :recipent_id, :recipent_type], unique: true
  end
end
