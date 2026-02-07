# config.py

class ApiTubeConfig:
    def __init__(self, api_key: str, base_url: str = 'https://api.apitube.io/v1/news'):
        self.api_key = api_key
        self.base_url = base_url

    def get_api_key(self) -> str:
        return self.api_key

    def get_base_url(self) -> str:
        return self.base_url
