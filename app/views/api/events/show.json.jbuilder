json.(@event, :name, :description, :time, :duration)

json.manager do
  json.(@event.manager, :name, :blog_link, :signature)
end