#r "nuget: FSharp.Data"

open FSharp.Data

let response =
    Http.RequestString(
        "https://api.apitube.io/v1/news/everything",
        query = [ "per_page", "50"; "api_key", "YOUR_API_KEY" ]
    )

printfn "%s" response
