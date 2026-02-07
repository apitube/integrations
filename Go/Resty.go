package main

import (
	"fmt"
	"log"

	"github.com/go-resty/resty/v2"
)

func main() {
	client := resty.New()

	resp, err := client.R().
		SetQueryParams(map[string]string{
			"per_page": "50",
			"api_key":  "YOUR_API_KEY",
		}).
		Get("https://api.apitube.io/v1/news/everything")

	if err != nil {
		log.Fatalf("Error: %v", err)
	}

	fmt.Println(resp.String())
}
