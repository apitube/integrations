OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
	.url("https://apitube.io/v1/news?limit=250&offset=0")
	.get()
	.addHeader("X-ApiTube-Key", "***KEY***")
	.build();

Response response = client.newCall(request).execute();
