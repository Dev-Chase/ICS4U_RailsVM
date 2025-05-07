class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :supplier_id
      t.integer :category_id
      t.string :unit
      t.float :price

      t.timestamps
    end
  end
end
