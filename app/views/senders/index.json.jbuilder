json.array!(@senders) do |sender|
  json.extract! sender, :id, :phone, :name
  json.url sender_url(sender, format: :json)
end
