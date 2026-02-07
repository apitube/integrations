import requests

url = "https://api.apitube.io/v1/news/everything"

querystring = {"per_page":"50", "api_key":"YOUR_API_KEY"}

response = requests.request("GET", url, params=querystring)

print(response.text)
