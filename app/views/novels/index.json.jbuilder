json.array!(@novels) do |novel|
  json.extract! novel, :id, :title, :genere, :description
  json.url novel_url(novel, format: :json)
end
