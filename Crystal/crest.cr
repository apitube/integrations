require "crest"

response = Crest.get(
  "https://api.apitube.io/v1/news/everything",
  params: {:per_page => "50", :api_key => "YOUR_API_KEY"}
)

puts response.body
