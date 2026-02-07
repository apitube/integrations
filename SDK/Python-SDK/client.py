# client.py

import requests
from config import ApiTubeConfig

class ApiTubeClient:
    def __init__(self, config: ApiTubeConfig):
        self.config = config

    def request(self, endpoint: str, params: dict = None) -> dict:
        if params is None:
            params = {}

        # Build the full URL
        url = f"{self.config.get_base_url()}{endpoint}"

        # Set the headers
        headers = {
            'X-Api-Key': self.config.get_api_key()
        }

        # Make the request
        response = requests.get(url, headers=headers, params=params)

        # Raise an exception if the request was unsuccessful
        response.raise_for_status()

        # Return the JSON response
        return response.json()
