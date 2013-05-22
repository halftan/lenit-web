json.array! @events do |event|
  json.(event, :id, :name, :description, :time, :created_at, :duration, :location)
  json.host_name(event.host_name)
  json.url api_event_url(event)
end
