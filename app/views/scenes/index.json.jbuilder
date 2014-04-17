json.array!(@scenes) do |scene|
  json.extract! scene, :id, :title, :content, :order
  json.url scene_url(scene, format: :json)
end
