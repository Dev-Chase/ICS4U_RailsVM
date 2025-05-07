json.extract! employee, :id, :last_name, :first_name, :birth_date, :notes, :created_at, :updated_at
json.url employee_url(employee, format: :json)
