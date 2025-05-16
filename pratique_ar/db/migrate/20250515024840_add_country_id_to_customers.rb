class AddCountryIdToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :country, null: true, foreign_key: true
  end
end
