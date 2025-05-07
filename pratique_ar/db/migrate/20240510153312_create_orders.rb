class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :employee_id
      t.date :order_date
      t.integer :shipper_id

      t.timestamps
    end
  end
end
