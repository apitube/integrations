import Alamofire

let url = "https://api.apitube.io/v1/news/everything"
let parameters: [String: String] = ["limit": "50", "api_key": "YOUR_API_KEY"]

AF.request(url, parameters: parameters).response { response in
    if let data = response.data {
        print(String(data: data, encoding: .utf8) ?? "No response data")
    } else {
        print("Error: \(response.error?.localizedDescription ?? "Unknown error")")
    }
}
