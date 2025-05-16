class RemoveCityIdIdFromSuppliers < ActiveRecord::Migration[6.0]
  def change
    remove_column :suppliers, :city_id_id, :integer
  end
end
