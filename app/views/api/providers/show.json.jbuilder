json.(@provider, :name, :description)

json.manager do
  json.(@provider.manager, :name, :blog_link, :signature)
end

json.events do
  json.array! @provider.provided_events do |event|
    json.(event, :name, :location, :description)
  end
end