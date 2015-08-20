json.array!(@products) do |product|
  json.extract! product, :id, :name, :manufacturerProducer, :supplier, :retailer
  json.url product_url(product, format: :json)
end
