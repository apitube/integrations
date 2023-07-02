var client = new HttpClient();
var request = new HttpRequestMessage
{
	Method = HttpMethod.Get,
	RequestUri = new Uri("https://apitube.io/v1/news?limit=250&offset=0"),
	Headers =
	{
		{ "X-ApiTube-Key", "***KEY***" },
	},
};
using (var response = await client.SendAsync(request))
{
	response.EnsureSuccessStatusCode();
	var body = await response.Content.ReadAsStringAsync();
	Console.WriteLine(body);
}
