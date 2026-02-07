use reqwest::blocking::Client;
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>> {
    let client = Client::new();

    let response = client
        .get("https://api.apitube.io/v1/news/everything")
        .query(&[("per_page", "50"), ("api_key", "YOUR_API_KEY")])
        .send()?;

    if response.status().is_success() {
        let body = response.text()?;
        println!("{}", body);
    } else {
        eprintln!("HTTP Request Error: {}", response.status());
    }

    Ok(())
}
