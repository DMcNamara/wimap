json.array!(@tracks) do |track|
  json.extract! track, :id, :user_id, :latitude, :longitude
  json.url track_url(track, format: :json)
end
