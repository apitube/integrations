<?php

class ApiTubeNewsService
{
	private $client;

	public function __construct(ApiTubeClient $client)
	{
		$this->client = $client;
	}

	public function getArticles($params = [])
	{
		return $this->client->request('/articles', $params);
	}
}
