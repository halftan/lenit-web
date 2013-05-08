json.array! @events do |event|
  json.(event, :name, :description, :time)
  json.url api_event_url(event)
end