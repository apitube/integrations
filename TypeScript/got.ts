import got from 'got';

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
    try {
        const response = await got<NewsResponse>(
            'https://api.apitube.io/v1/news/everything',
            {
                searchParams: {
                    per_page: 50,
                    api_key: 'YOUR_API_KEY'
                },
                responseType: 'json'
            }
        );

        console.log(JSON.stringify(response.body, null, 2));
    } catch (error) {
        console.error('HTTP Request Error:', error);
    }
}

fetchNews();
