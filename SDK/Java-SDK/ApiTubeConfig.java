// ApiTubeConfig.java

public class ApiTubeConfig {
    private String apiKey;
    private String baseUrl;

    public ApiTubeConfig(String apiKey) {
        this.apiKey = apiKey;
        this.baseUrl = "https://api.apitube.io/v1/news";
    }

    public String getApiKey() {
        return apiKey;
    }

    public String getBaseUrl() {
        return baseUrl;
    }
}
