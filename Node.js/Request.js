const request = require('request');

const options = {
    method: 'GET',
    url: 'https://api.apitube.io/v1/news/everything',
    qs: {
        limit: '50',
        api_key: 'YOUR_API_KEY'
    }
};

request(options, function (error, response, body) {
    if (error) throw new Error(error);

    console.log(body);
});
