def url = new URL("https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY")
def connection = url.openConnection() as HttpURLConnection
connection.requestMethod = "GET"

if (connection.responseCode == 200) {
    println connection.inputStream.text
} else {
    println "Error: ${connection.responseCode}"
}
