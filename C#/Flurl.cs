using System;
using System.Threading.Tasks;
using Flurl;
using Flurl.Http;

class Program
{
    static async Task Main(string[] args)
    {
        var result = await "https://api.apitube.io/v1/news/everything"
            .SetQueryParams(new { per_page = 50, api_key = "YOUR_API_KEY" })
            .GetStringAsync();

        Console.WriteLine(result);
    }
}
