const { request } = require('undici');

async function fetchNews() {
    const url = new URL('https://api.apitube.io/v1/news/everything');
    url.searchParams.append('per_page', '50');
    url.searchParams.append('api_key', 'YOUR_API_KEY');

    try {
        const { statusCode, body } = await request(url);

        if (statusCode === 200) {
            const data = await body.json();
            console.log(JSON.stringify(data, null, 2));
        } else {
            console.error(`HTTP Request Error: ${statusCode}`);
        }
    } catch (error) {
        console.error('Request failed:', error.message);
    }
}

fetchNews();
