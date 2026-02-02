OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
	.url("https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY")
	.get()
	.build();

Response response = client.newCall(request).execute();
