import std/[asyncdispatch, httpclient]

proc fetchNews() {.async.} =
    let client = newAsyncHttpClient()
    let url = "https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY"
    let response = await client.getContent(url)
    echo response

waitFor fetchNews()
