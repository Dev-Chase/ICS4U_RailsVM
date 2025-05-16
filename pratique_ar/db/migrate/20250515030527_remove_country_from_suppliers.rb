class RemoveCountryFromSuppliers < ActiveRecord::Migration[6.0]
  def change
    remove_column :suppliers, :country, :string
  end
end
