json.array!(@incoming_messages) do |incoming_message|
  json.extract! incoming_message, :id, :sender, :message
  json.url incoming_message_url(incoming_message, format: :json)
end
