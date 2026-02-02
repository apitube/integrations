const got = require('got');

async function fetchNews() {
    try {
        const response = await got('https://api.apitube.io/v1/news/everything', {
            searchParams: {
                limit: 50,
                api_key: 'YOUR_API_KEY'
            },
            responseType: 'json'
        });

        console.log(JSON.stringify(response.body, null, 2));
    } catch (error) {
        if (error.response) {
            console.error(`HTTP Request Error: ${error.response.statusCode}`);
        } else {
            console.error('Request failed:', error.message);
        }
    }
}

fetchNews();
