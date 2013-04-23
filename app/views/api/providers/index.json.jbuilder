json.array! @providers do |provider|
  json.(provider, :name, :description)
  json.url api_provider_url(provider)
end