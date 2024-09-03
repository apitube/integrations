// ApiTubeNewsService.java

import java.util.Map;

public class ApiTubeNewsService {
    private ApiTubeClient client;

    public ApiTubeNewsService(ApiTubeClient client) {
        this.client = client;
    }

    public String getArticles(Map<String, String> params) throws Exception {
        return client.request("/articles", params);
    }
}
