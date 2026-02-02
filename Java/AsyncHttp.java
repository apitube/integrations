AsyncHttpClient client = new DefaultAsyncHttpClient();
client.prepare("GET", "https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY")
	.execute()
	.toCompletableFuture()
	.thenAccept(System.out::println)
	.join();

client.close();
