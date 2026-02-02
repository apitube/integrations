const superagent = require('superagent');

async function fetchNews() {
    try {
        const response = await superagent
            .get('https://api.apitube.io/v1/news/everything')
            .query({
                per_page: 50,
                api_key: 'YOUR_API_KEY'
            });

        console.log(JSON.stringify(response.body, null, 2));
    } catch (error) {
        if (error.response) {
            console.error(`HTTP Request Error: ${error.response.status}`);
        } else {
            console.error('Request failed:', error.message);
        }
    }
}

fetchNews();
