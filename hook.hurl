# /hook/webhook POST -------------
POST {{BASE_URL}}/hook/webhook
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "action": "feed",
    "url": "https://www.nytimes.com",
    "secret": "secret"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.action" == "feed"
jsonpath "$.url" == "https://www.nytimes.com"
# ---------------------------------

# /hook/webhook GET -------------
GET {{BASE_URL}}/hook/webhook
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.feed" == "https://www.nytimes.com"
jsonpath "$.updated" exists
# ---------------------------------

# /hook/webhook DELETE -------------
DELETE {{BASE_URL}}/hook/webhook
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "action": "feed"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.action" == "feed"
# ---------------------------------

