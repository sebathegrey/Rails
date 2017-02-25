class AddUserIdToMyList < ActiveRecord::Migration[5.0]
  def change
    add_column :my_lists, :user_id, :integer
    add_index :my_lists, :user_id
  end
end
