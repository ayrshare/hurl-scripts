# /short -----------------
POST {{BASE_URL}}/api/short
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "url": "https://www.ayrshare.com"
}

HTTP/* 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.shortUrl" exists
jsonpath "$.originalUrl" == "https://www.ayrshare.com"
# -----------------------