local requests = require("requests")

local response = requests.get{
    url = "https://api.apitube.io/v1/news/everything",
    params = {
        per_page = "50",
        api_key = "YOUR_API_KEY"
    }
}

print(response.text)
