json.array!(@artwork) do |artwork|
  json.extract! artwork, :id, :name, :artist_id, :medium, :image_url
  json.url artwork_url(artwork, format: :json)
end
