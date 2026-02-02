require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('https://api.apitube.io/v1/news/everything')
params = { per_page: 50, api_key: 'YOUR_API_KEY' }
uri.query = URI.encode_www_form(params)

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)

if response.code.to_i == 200
  data = JSON.parse(response.body)
  puts JSON.pretty_generate(data)
else
  puts "HTTP Request Error: #{response.code}"
end
