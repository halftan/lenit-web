json.(@provider, :name, :description, :created_at)

json.manager do
  json.(@provider.manager, :name, :blog_link, :signature)
end

json.events do
  json.array! @provider.provided_events do |event|
    json.(event, :name, :location, :description, :created_at)
  end
end