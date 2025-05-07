class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.string :contact_name
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end
end
