defmodule ApiTube.HTTPoison do
  @moduledoc """
  APITUBE News API integration using HTTPoison
  """

  def fetch_news do
    url = "https://api.apitube.io/v1/news/everything"
    params = URI.encode_query(%{per_page: 50, api_key: "YOUR_API_KEY"})

    case HTTPoison.get("#{url}?#{params}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "HTTP Request Error: #{status_code}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "Request failed: #{reason}"}
    end
  end
end

# Usage example
case ApiTube.HTTPoison.fetch_news() do
  {:ok, data} -> IO.inspect(data, pretty: true)
  {:error, message} -> IO.puts(message)
end
