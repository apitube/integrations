<?php

class ApiTubeConfig
{
	private $apiKey;
	private $baseUrl = 'https://api.apitube.io/v1/news';

	public function __construct($apiKey)
	{
		$this->apiKey = $apiKey;
	}

	public function getApiKey()
	{
		return $this->apiKey;
	}

	public function getBaseUrl()
	{
		return $this->baseUrl;
	}
}
