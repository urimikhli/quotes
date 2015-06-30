json.array!(@quotes) do |quote|
  json.extract! quote, :id, :symbol
  json.url quote_url(quote, format: :json)
end
