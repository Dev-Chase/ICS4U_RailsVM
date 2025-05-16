class AddCountryIdToSuppliers < ActiveRecord::Migration[6.0]
  def change
    add_reference :suppliers, :country, null: true, foreign_key: true
  end
end
