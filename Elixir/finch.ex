defmodule ApiTube.Finch do
  @moduledoc """
  APITUBE News API integration using Finch
  """

  def fetch_news do
    # Start Finch in your application supervision tree
    # Finch.start_link(name: ApiTubeFinch)

    url = "https://api.apitube.io/v1/news/everything"
    params = URI.encode_query(%{limit: 50, api_key: "YOUR_API_KEY"})

    request = Finch.build(:get, "#{url}?#{params}")

    case Finch.request(request, ApiTubeFinch) do
      {:ok, %Finch.Response{status: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %Finch.Response{status: status}} ->
        {:error, "HTTP Request Error: #{status}"}

      {:error, reason} ->
        {:error, "Request failed: #{inspect(reason)}"}
    end
  end
end

# Usage example (ensure Finch is started first)
# {:ok, _} = Finch.start_link(name: ApiTubeFinch)
# case ApiTube.Finch.fetch_news() do
#   {:ok, data} -> IO.inspect(data, pretty: true)
#   {:error, message} -> IO.puts(message)
# end
