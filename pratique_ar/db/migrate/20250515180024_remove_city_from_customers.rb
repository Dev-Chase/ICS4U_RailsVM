class RemoveCityFromCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :city, :string
  end
end
