<?php

class ApiTubeClient
{
	private $config;

	public function __construct(ApiTubeConfig $config)
	{
		$this->config = $config;
	}

	public function request($endpoint, $params = [])
	{
		// Build query string
		$query = http_build_query($params);

		// Create the URL
		$url = $this->config->getBaseUrl() . $endpoint . '?' . $query;

		// Initialize cURL
		$request = curl_init($url);

		// Set headers
		curl_setopt($request, CURLOPT_HTTPHEADER, [
			'X-Api-Key: ' . $this->config->getApiKey(),
		]);

		// Set options to return the result
		curl_setopt($request, CURLOPT_RETURNTRANSFER, true);

		// Execute the request
		$result = curl_exec($request);

		// Close the request
		curl_close($request);

		// Decode the result
		return json_decode($result, true);
	}
}
