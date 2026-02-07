import com.github.kittinunf.fuel.httpGet
import com.github.kittinunf.result.Result

fun main() {
    "https://api.apitube.io/v1/news/everything"
        .httpGet(listOf("per_page" to "50", "api_key" to "YOUR_API_KEY"))
        .responseString { _, _, result ->
            when (result) {
                is Result.Success -> println(result.get())
                is Result.Failure -> println("Error: ${result.getException()}")
            }
        }
}
