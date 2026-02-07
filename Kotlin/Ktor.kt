import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import kotlinx.coroutines.runBlocking

fun main() = runBlocking {
    val client = HttpClient(CIO)

    val response: HttpResponse = client.get("https://api.apitube.io/v1/news/everything") {
        url {
            parameters.append("per_page", "50")
            parameters.append("api_key", "YOUR_API_KEY")
        }
    }

    println(response.bodyAsText())
    client.close()
}
