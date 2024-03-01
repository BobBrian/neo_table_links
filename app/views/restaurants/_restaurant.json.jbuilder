json.extract! restaurant, :id, :restaurant_name, :address, :email, :contact_number, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
