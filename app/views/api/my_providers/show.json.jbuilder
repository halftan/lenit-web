json.(@provider, :name, :description)

json.events do
  json.array! @provider.provided_events do |event|
    json.(event, :name, :location, :description)
  end
end