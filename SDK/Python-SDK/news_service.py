# news_service.py

from client import ApiTubeClient

class ApiTubeNewsService:
    def __init__(self, client: ApiTubeClient):
        self.client = client

    def get_articles(self, params: dict = None) -> dict:
        return self.client.request('/articles', params)
