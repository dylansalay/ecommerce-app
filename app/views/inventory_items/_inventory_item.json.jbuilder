json.extract! inventory_item, :id, :title, :body, :unit_cost, :created_at, :updated_at
json.url inventory_item_url(inventory_item, format: :json)
