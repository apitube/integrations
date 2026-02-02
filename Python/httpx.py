import httpx
import json

def fetch_news_sync():
    """Synchronous example using httpx"""
    url = "https://api.apitube.io/v1/news/everything"
    params = {
        "limit": 50,
        "api_key": "YOUR_API_KEY"
    }

    with httpx.Client() as client:
        response = client.get(url, params=params)

        if response.status_code == 200:
            data = response.json()
            print(json.dumps(data, indent=2))
        else:
            print(f"HTTP Request Error: {response.status_code}")

async def fetch_news_async():
    """Asynchronous example using httpx"""
    url = "https://api.apitube.io/v1/news/everything"
    params = {
        "limit": 50,
        "api_key": "YOUR_API_KEY"
    }

    async with httpx.AsyncClient() as client:
        response = await client.get(url, params=params)

        if response.status_code == 200:
            data = response.json()
            print(json.dumps(data, indent=2))
        else:
            print(f"HTTP Request Error: {response.status_code}")

if __name__ == "__main__":
    # Synchronous usage
    fetch_news_sync()

    # Asynchronous usage
    # import asyncio
    # asyncio.run(fetch_news_async())
