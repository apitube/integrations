(require '[clj-http.client :as client])

(client/get "https://apitube.io/v1/news" {:headers {:X-ApiTube-Key "***KEY***"}
                                                             :query-params {:limit "250" :offset "0"}})



