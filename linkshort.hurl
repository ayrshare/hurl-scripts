# /link -----------------
POST {{BASE_URL}}/api/link
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "url": "https://www.ayrshare.com"
}

HTTP 200
[Captures]
urlId: jsonpath "$.shortUrl" regex /https:\/\/ayrs.io\/(.*)/
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.shortUrl" matches /https:\/\/ayrs.io\/(.*)/
jsonpath "$.shortUrl" contains "{{urlId}}"
jsonpath "$.id" == "{{urlId}}"
jsonpath "$.originalUrl" == "https://www.ayrshare.com"
jsonpath "$.created" exists
# -----------------------