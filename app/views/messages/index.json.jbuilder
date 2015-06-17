json.array!(@messages) do |message|
  json.extract! message, :id, :userSent, :userReceive, :message, :createdAt
  json.url message_url(message, format: :json)
end
