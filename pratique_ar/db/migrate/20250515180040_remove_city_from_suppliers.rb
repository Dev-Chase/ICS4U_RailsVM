class RemoveCityFromSuppliers < ActiveRecord::Migration[6.0]
  def change
    remove_column :suppliers, :city, :string
  end
end
