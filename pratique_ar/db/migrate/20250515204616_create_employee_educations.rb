class CreateEmployeeEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_educations do |t|
      t.string :institution
      t.string :degree
      t.date :date_obtained
      t.boolean :completed
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
