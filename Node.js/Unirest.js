const unirest = require("unirest");

const req = unirest("GET", "https://api.apitube.io/v1/news/everything");

req.query({
    "limit": "50",
    "api_key": "YOUR_API_KEY"
});

req.end(function (res) {
    if (res.error) throw new Error(res.error);

    console.log(res.body);
});
