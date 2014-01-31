json.array!(@routers) do |router|
  json.extract! router, :id, :site_id, :x, :y, :z, :ssid, :uid, :power
  json.url router_url(router, format: :json)
end
