json.array! @events do |event|
  json.(event, :name, :description, :time, :created_at)
  json.url api_event_url(event)
end