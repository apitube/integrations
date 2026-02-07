import axios from 'axios';

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
        const response = await axios.get<NewsResponse>(
            'https://api.apitube.io/v1/news/everything',
            {
                params: {
                    per_page: 50,
                    api_key: 'YOUR_API_KEY'
                }
            }
        );

        console.log(JSON.stringify(response.data, null, 2));
    } catch (error) {
        if (axios.isAxiosError(error)) {
            console.error(`HTTP Request Error: ${error.response?.status}`);
        } else {
            console.error('Unexpected error:', error);
        }
    }
}

fetchNews();
