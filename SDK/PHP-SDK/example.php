<?php

// Include or autoload the classes here

// Initialize the configuration with your API key
$config = new ApiTubeConfig('YOUR_API_KEY');

// Initialize the client
$client = new ApiTubeClient($config);

// Initialize the service
$newsService = new ApiTubeNewsService($client);

// Define parameters
$params = [
	'published_at' => '[NOW-1HOUR/HOUR TO NOW/HOUR]',
	'language' => '(en)',
	'categories' => '(Technology OR Business)',
	'per_page' => 5,
];

// Fetch articles
$articles = $newsService->getArticles($params);

// Output the articles
print_r($articles);
