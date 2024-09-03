(require '[clj-http.client :as client])

(defn fetch-data []
  (let [url "https://api.apitube.io/v1/news/everything"
        params {:query-params {"limit" "50" "api_key" "YOUR_API_KEY"}}
        response (client/get url params)]
    (if (= 200 (:status response))
      (println (:body response))
      (println "Error:" (:status response)))))

(fetch-data)
