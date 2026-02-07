require "http/client"
require "uri"

params = URI::Params.encode({"per_page" => "50", "api_key" => "YOUR_API_KEY"})
response = HTTP::Client.get("https://api.apitube.io/v1/news/everything?#{params}")

if response.status_code == 200
  puts response.body
else
  puts "Error: #{response.status_code}"
end
