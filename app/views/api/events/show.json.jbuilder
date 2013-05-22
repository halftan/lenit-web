json.(@event, :id, :name, :description, :time, :created_at, :duration, :location)

json.host do
  json.host_id(@event.owner_id)
  json.host_name(@event.host_name)
end
