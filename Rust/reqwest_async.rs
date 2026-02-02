use reqwest::Client;
use tokio;

#[tokio::main]
async fn main() -> Result<(), reqwest::Error> {
    let client = Client::new();

    let response = client
        .get("https://api.apitube.io/v1/news/everything")
        .query(&[("per_page", "50"), ("api_key", "YOUR_API_KEY")])
        .send()
        .await?;

    if response.status().is_success() {
        let body = response.text().await?;
        println!("{}", body);
    } else {
        eprintln!("HTTP Request Error: {}", response.status());
    }

    Ok(())
}
