json.extract! event, :id, :titile, :event_place, :amount, :event_date, :created_at, :updated_at
json.url event_url(event, format: :json)
