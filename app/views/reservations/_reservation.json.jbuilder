json.extract! reservation, :id, :reservation_name, :reservation_date, :is_active, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
