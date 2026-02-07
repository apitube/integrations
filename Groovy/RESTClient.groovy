@Grab('org.codehaus.groovy.modules.http-builder:http-builder:0.7.1')
import groovyx.net.http.RESTClient
import static groovyx.net.http.ContentType.JSON

def client = new RESTClient("https://api.apitube.io")

def response = client.get(
    path: "/v1/news/everything",
    query: [per_page: "50", api_key: "YOUR_API_KEY"],
    contentType: JSON
)

println response.data
