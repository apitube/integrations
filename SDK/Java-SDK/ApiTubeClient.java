// ApiTubeClient.java

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

public class ApiTubeClient {
    private ApiTubeConfig config;

    public ApiTubeClient(ApiTubeConfig config) {
        this.config = config;
    }

    public String request(String endpoint, Map<String, String> params) throws Exception {
        // Build the query string
        StringBuilder query = new StringBuilder();
        if (params != null) {
            for (Map.Entry<String, String> entry : params.entrySet()) {
                query.append(entry.getKey())
                     .append("=")
                     .append(entry.getValue())
                     .append("&");
            }
        }

        // Build the full URL
        String urlString = config.getBaseUrl() + endpoint + "?" + query.toString();
        URL url = new URL(urlString);

        // Create the connection
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        // Set the headers
        conn.setRequestProperty("X-Api-Key", config.getApiKey());

        // Get the response
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuilder content = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            content.append(inputLine);
        }

        // Clean up
        in.close();
        conn.disconnect();

        return content.toString();
    }
}
