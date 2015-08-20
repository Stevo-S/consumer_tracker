json.array!(@outgoing_messages) do |outgoing_message|
  json.extract! outgoing_message, :id, :recipient, :message
  json.url outgoing_message_url(outgoing_message, format: :json)
end
