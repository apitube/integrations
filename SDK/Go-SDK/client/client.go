// client/client.go

package client

import (
    "encoding/json"
    "fmt"
    "io/ioutil"
    "net/http"
    "net/url"

    "apitube/config"
)

type Client struct {
    config *config.Config
}

func NewClient(cfg *config.Config) *Client {
    return &Client{
        config: cfg,
    }
}

func (c *Client) Request(endpoint string, params map[string]string) (map[string]interface{}, error) {
    // Build the query string
    query := url.Values{}
    for key, value := range params {
        query.Add(key, value)
    }

    // Create the full URL
    fullURL := fmt.Sprintf("%s%s?%s", c.config.BaseURL, endpoint, query.Encode())

    // Create the request
    req, err := http.NewRequest("GET", fullURL, nil)
    if err != nil {
        return nil, err
    }

    // Set the headers
    req.Header.Set("X-Api-Key", c.config.APIKey)

    // Perform the request
    resp, err := http.DefaultClient.Do(req)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()

    if resp.StatusCode != http.StatusOK {
        return nil, fmt.Errorf("failed to fetch data: %s", resp.Status)
    }

    // Read and parse the response
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        return nil, err
    }

    var result map[string]interface{}
    if err := json.Unmarshal(body, &result); err != nil {
        return nil, err
    }

    return result, nil
}
