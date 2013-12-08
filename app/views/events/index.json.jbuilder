json.array!(@events) do |event|
  json.extract! event, :id, :title, :location, :start, :end, :user_id, :game_id
  json.url event_url(event, format: :json)
end
