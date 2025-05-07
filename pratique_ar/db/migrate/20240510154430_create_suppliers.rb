class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :supplier_name
      t.string :contact_name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :phone

      t.timestamps
    end
  end
end
