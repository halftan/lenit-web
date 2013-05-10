json.array! @providers do |provider|
  json.(provider, :name, :description, :created_at)
  json.url api_my_provider_url(provider)
end