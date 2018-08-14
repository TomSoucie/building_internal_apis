json.(@order, :id, :order_number)
json.num_items(@order.items.count)
json.items @order.items do |item|
  json.(item, :id)
end
