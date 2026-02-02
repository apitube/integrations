use hyper::{Client, Uri};
use hyper_tls::HttpsConnector;
use tokio;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
    let https = HttpsConnector::new();
    let client = Client::builder().build::<_, hyper::Body>(https);

    let uri: Uri = "https://api.apitube.io/v1/news/everything?limit=50&api_key=YOUR_API_KEY"
        .parse()?;

    let response = client.get(uri).await?;

    if response.status().is_success() {
        let body_bytes = hyper::body::to_bytes(response.into_body()).await?;
        let body = String::from_utf8(body_bytes.to_vec())?;
        println!("{}", body);
    } else {
        eprintln!("HTTP Request Error: {}", response.status());
    }

    Ok(())
}
