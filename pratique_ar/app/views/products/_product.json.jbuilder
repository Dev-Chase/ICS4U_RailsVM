json.extract! product, :id, :product_name, :supplier_id, :category_id, :unit, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
