import sttp.client3._

object ApiTubeSttp extends App {
  val backend = HttpClientSyncBackend()

  val request = basicRequest
    .get(uri"https://api.apitube.io/v1/news/everything?limit=50&api_key=YOUR_API_KEY")

  val response = request.send(backend)

  response.body match {
    case Right(body) => println(body)
    case Left(error) => println(s"HTTP Request Error: $error")
  }

  backend.close()
}
