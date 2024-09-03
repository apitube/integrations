<?php

require 'vendor/autoload.php';

use GuzzleHttp\Client;

$client = new Client();
$response = $client->request('GET', 'https://api.apitube.io/v1/news/everything', [
	'query' => [
		'limit' => 50,
		'api_key' => 'YOUR_API_KEY'
	],
]);

echo $response->getBody();
