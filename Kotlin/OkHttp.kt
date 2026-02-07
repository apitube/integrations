val client = OkHttpClient()

val request = Request.Builder()
	.url("https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY")
	.get()
	.build()

val response = client.newCall(request).execute()
