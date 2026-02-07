use ureq;

fn main() -> Result<(), ureq::Error> {
    let response = ureq::get("https://api.apitube.io/v1/news/everything")
        .query("per_page", "50")
        .query("api_key", "YOUR_API_KEY")
        .call()?;

    if response.status() == 200 {
        let body = response.into_string()?;
        println!("{}", body);
    } else {
        eprintln!("HTTP Request Error: {}", response.status());
    }

    Ok(())
}
