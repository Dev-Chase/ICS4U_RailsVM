json.extract! supplier, :id, :supplier_name, :contact_name, :address, :city, :postal_code, :country, :phone, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
