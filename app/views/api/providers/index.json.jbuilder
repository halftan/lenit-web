json.array! @providers do |provider|
  json.(provider, :name, :description, :created_at)
  json.url api_provider_url(provider)
end