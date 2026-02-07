import std/[httpclient, uri]

let client = newHttpClient()
let url = "https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY"
let response = client.getContent(url)

echo response
