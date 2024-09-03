var client = new RestClient("https://api.apitube.io/v1/news/everything?limit=50&api_key=YOUR_API_KEY");
var request = new RestRequest(Method.GET);
IRestResponse response = client.Execute(request);
