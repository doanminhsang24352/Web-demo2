json.extract! product, :id, :name, :price, :tag, :string, :created_at, :updated_at
json.url product_url(product, format: :json)
