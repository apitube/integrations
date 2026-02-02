library(httr)

url <- "https://api.apitube.io/v1/news/everything"
response <- GET(url, query = list(per_page = 50, api_key = "YOUR_API_KEY"))

if (status_code(response) == 200) {
  content <- content(response, "text")
  print(content)
} else {
  print(paste("Error:", status_code(response)))
}
