json.(@orders) do |order|
  json.(order, :id, :order_number)
  json.num_items(order.items.count)
end
