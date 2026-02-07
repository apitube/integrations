local http = require("socket.http")
local ltn12 = require("ltn12")

local response_body = {}

local res, code, headers = http.request{
    url = "https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY",
    method = "GET",
    sink = ltn12.sink.table(response_body)
}

if code == 200 then
    print(table.concat(response_body))
else
    print("Error: " .. tostring(code))
end
