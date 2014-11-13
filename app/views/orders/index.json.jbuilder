json.array!(@orders) do |order|
  json.extract! order, :id, :product_id, :amount, :user_id
  json.product_name order.product.name
  json.url order_url(order, format: :json)
end
