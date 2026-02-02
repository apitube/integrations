require 'faraday'
require 'json'

conn = Faraday.new(url: 'https://api.apitube.io') do |f|
  f.request :url_encoded
  f.adapter Faraday.default_adapter
end

response = conn.get('/v1/news/everything', {
  per_page: 50,
  api_key: 'YOUR_API_KEY'
})

if response.success?
  data = JSON.parse(response.body)
  puts JSON.pretty_generate(data)
else
  puts "HTTP Request Error: #{response.status}"
end
