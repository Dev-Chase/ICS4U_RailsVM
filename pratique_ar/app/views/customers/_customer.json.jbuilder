json.extract! customer, :id, :customer_name, :contact_name, :address, :city, :postal_code, :country, :created_at, :updated_at
json.url customer_url(customer, format: :json)
