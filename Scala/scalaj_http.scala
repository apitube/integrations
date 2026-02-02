import scalaj.http._

object ApiTubeScalajHttp extends App {
  val response = Http("https://api.apitube.io/v1/news/everything")
    .param("limit", "50")
    .param("api_key", "YOUR_API_KEY")
    .asString

  if (response.isSuccess) {
    println(response.body)
  } else {
    println(s"HTTP Request Error: ${response.code}")
  }
}
