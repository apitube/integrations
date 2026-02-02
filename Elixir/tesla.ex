defmodule ApiTube.Tesla do
  @moduledoc """
  APITUBE News API integration using Tesla
  """

  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.apitube.io/v1/news"
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Query, api_key: "YOUR_API_KEY"

  def fetch_news(opts \\ []) do
    limit = Keyword.get(opts, :limit, 50)

    case get("/everything", query: [limit: limit]) do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %Tesla.Env{status: status}} ->
        {:error, "HTTP Request Error: #{status}"}

      {:error, reason} ->
        {:error, "Request failed: #{inspect(reason)}"}
    end
  end
end

# Usage example
case ApiTube.Tesla.fetch_news(limit: 50) do
  {:ok, data} -> IO.inspect(data, pretty: true)
  {:error, message} -> IO.puts(message)
end
