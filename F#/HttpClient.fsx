open System
open System.Net.Http

let fetchNews () =
    async {
        use client = new HttpClient()
        let url = "https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY"
        let! response = client.GetStringAsync(url) |> Async.AwaitTask
        printfn "%s" response
    }

fetchNews () |> Async.RunSynchronously
