json.extract! table, :id, :table_name, :seat_number, :is_available, :created_at, :updated_at
json.url table_url(table, format: :json)
