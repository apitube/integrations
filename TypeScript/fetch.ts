interface NewsResponse {
    status: string;
    data: Article[];
}

interface Article {
    title: string;
    description: string;
    url: string;
    published_at: string;
}

async function fetchNews(): Promise<void> {
    const params = new URLSearchParams({
        per_page: '50',
        api_key: 'YOUR_API_KEY'
    });

    try {
        const response = await fetch(
            `https://api.apitube.io/v1/news/everything?${params}`
        );

        if (!response.ok) {
            throw new Error(`HTTP Request Error: ${response.status}`);
        }

        const data: NewsResponse = await response.json();
        console.log(JSON.stringify(data, null, 2));
    } catch (error) {
        console.error(error);
    }
}

fetchNews();
