require 'httparty'

response = HTTParty.get('https://api.apitube.io/v1/news/everything', query: { limit: 50, api_key: 'YOUR_API_KEY' })

if response.success?
  puts response.body
else
  puts "Error: #{response.code}"
end
