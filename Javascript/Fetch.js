const options = {
    method: 'GET'
};

fetch('https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY', options)
    .then(response => response.json())
    .then(response => console.log(response))
    .catch(err => console.error(err));
