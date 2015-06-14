json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :target_id
  json.url comment_url(comment, format: :json)
end
