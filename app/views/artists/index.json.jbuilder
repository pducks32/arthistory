json.array!(@artists) do |artist|
  json.extract! artist, :id, :vasarian_age, :name_id
  json.url artist_url(artist, format: :json)
end
