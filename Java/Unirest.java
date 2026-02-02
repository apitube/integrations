HttpResponse<String> response = Unirest.get("https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY")
	.asString();
