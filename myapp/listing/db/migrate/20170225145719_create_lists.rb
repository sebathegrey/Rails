class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :description
      t.boolean :done
      t.references :my_list, foreign_key: true

      t.timestamps
    end
  end
end
