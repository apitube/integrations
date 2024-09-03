// news/news_service.go

package news

import (
    "apitube/client"
)

type NewsService struct {
    client *client.Client
}

func NewNewsService(c *client.Client) *NewsService {
    return &NewsService{
        client: c,
    }
}

func (ns *NewsService) GetArticles(params map[string]string) (map[string]interface{}, error) {
    return ns.client.Request("/articles", params)
}
