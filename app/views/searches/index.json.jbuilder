json.array!(@Searches) do |search|
  json.extract! search, :key, :linked
  json.url search_url(search, format: :json)
end
