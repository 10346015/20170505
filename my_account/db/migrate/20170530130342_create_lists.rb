class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :date
      t.string :item
      t.integer :cost
      t.string :kind
      t.integer :month

      t.timestamps
    end
  end
end
