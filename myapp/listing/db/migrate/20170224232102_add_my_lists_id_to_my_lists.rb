class AddMyListsIdToMyLists < ActiveRecord::Migration[5.0]
  def change
    add_column :my_lists, :my_lists_id, :integer
    add_index :my_lists, :my_lists_id
  end
end
