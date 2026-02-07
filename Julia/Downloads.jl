using Downloads
using JSON

url = "https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY"
response = Downloads.download(url, IOBuffer())
data = String(take!(response))

println(data)
