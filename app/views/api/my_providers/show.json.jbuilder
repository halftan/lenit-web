json.(@provider, :name, :description, :created_at)

json.events do
  json.array! @provider.provided_events do |event|
    json.(event, :name, :location, :description, :created_at)
  end
end