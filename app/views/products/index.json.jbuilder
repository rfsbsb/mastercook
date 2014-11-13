json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :category
  json.photo product.photo.url(:thumb)
  json.url product_url(product, format: :json)
end
