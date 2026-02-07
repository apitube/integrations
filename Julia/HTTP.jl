using HTTP
using JSON

response = HTTP.get("https://api.apitube.io/v1/news/everything", query = [
    "per_page" => "50",
    "api_key" => "YOUR_API_KEY"
])

println(String(response.body))
