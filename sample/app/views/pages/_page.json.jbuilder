json.extract! page, :id, :content, :nom, :titre, :slug, :category_id, :created_at, :updated_at
json.url page_url(page, format: :json)
