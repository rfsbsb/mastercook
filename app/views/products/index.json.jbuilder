json.array!(@products) do |product|
  json.extract! product, :id, :photo, :name, :price, :category
  json.url product_url(product, format: :json)
end
