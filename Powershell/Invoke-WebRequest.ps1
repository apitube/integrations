$url = "https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY"

try {
    $response = Invoke-RestMethod -Uri $url -Method Get
    $response | ConvertTo-Json
} catch {
    Write-Error "Error: $_"
}
