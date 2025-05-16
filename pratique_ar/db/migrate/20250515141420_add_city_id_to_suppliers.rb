class AddCityIdToSuppliers < ActiveRecord::Migration[6.0]
  def change
    add_reference :suppliers, :city, null: true, foreign_key: true
  end
end
