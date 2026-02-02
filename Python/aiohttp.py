import asyncio
import aiohttp
import json

async def fetch_news():
    url = "https://api.apitube.io/v1/news/everything"
    params = {
        "limit": 50,
        "api_key": "YOUR_API_KEY"
    }

    async with aiohttp.ClientSession() as session:
        async with session.get(url, params=params) as response:
            if response.status == 200:
                data = await response.json()
                print(json.dumps(data, indent=2))
            else:
                print(f"HTTP Request Error: {response.status}")

if __name__ == "__main__":
    asyncio.run(fetch_news())
