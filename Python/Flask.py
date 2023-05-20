from flask import Flask
import requests

app = Flask(__name__)

@app.route('/')
def make_request():
    url = "https://apitube.io/v1/sets/***ID_HERE***?limit=250&offset=0"
    api_key = "***KEY***"

    headers = {
        "X-ApiTube-Key": api_key
    }

    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        return response.text
    else:
        return f"HTTP Request Error: {response.status_code}"

if __name__ == '__main__':
    app.run()
