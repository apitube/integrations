// config/config.go

package config

type Config struct {
    APIKey  string
    BaseURL string
}

func NewConfig(apiKey string) *Config {
    return &Config{
        APIKey:  apiKey,
        BaseURL: "https://api.apitube.io/v1/news",
    }
}
