class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :last_name
      t.string :first_name
      t.date :birth_date
      t.string :notes

      t.timestamps
    end
  end
end
