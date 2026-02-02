use apitube::{ApiTubeConfig, ApiTubeClient, ApiTubeNewsService, NewsQueryParams};

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // Initialize configuration
    let config = ApiTubeConfig::new("YOUR_API_KEY");

    // Create client and service
    let client = ApiTubeClient::new(config)?;
    let news_service = ApiTubeNewsService::new(&client);

    // Fetch latest news
    println!("Fetching latest news...");
    let params = NewsQueryParams::new().limit(10);
    let latest_news = news_service.get_everything(params).await?;

    println!("Found {} articles", latest_news.total_results);
    for article in &latest_news.data {
        println!("- {}", article.title);
    }

    // Fetch news by category
    println!("\nFetching technology news...");
    let params = NewsQueryParams::new().limit(5);
    let tech_news = news_service.get_by_category("technology", params).await?;

    for article in &tech_news.data {
        println!("- {}", article.title);
    }

    // Fetch news by language
    println!("\nFetching English news...");
    let params = NewsQueryParams::new().limit(5);
    let english_news = news_service.get_by_language("en", params).await?;

    for article in &english_news.data {
        println!("- {}", article.title);
    }

    Ok(())
}
