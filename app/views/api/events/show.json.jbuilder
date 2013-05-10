json.(@event, :name, :description, :time, :duration, :created_at)

json.manager do
  json.(@event.manager, :name, :blog_link, :signature)
end