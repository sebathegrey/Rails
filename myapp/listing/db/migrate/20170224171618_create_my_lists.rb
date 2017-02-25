class CreateMyLists < ActiveRecord::Migration[5.0]
  def change
    create_table :my_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
