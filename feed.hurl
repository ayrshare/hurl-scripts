# /feed POST -----------------
POST {{BASE_URL}}/api/feed
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "url": "https://managingeditor.substack.com",
    "useFirstImage": true,
    "autoHashtag": true,
    "type": "rss"
}

HTTP 200
[Captures]
id: jsonpath "$.id"
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" exists
jsonpath "$.title" exists
jsonpath "$.websiteLink" == "https://managingeditor.substack.com"
jsonpath "$.feedURL" exists
jsonpath "$.autoHashtag" == true
jsonpath "$.useFirstImage" == true
# -----------------------

# /feed DELETE -----------------
DELETE {{BASE_URL}}/api/feed
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "id": "{{id}}"
}

HTTP 200
[Captures]
id: jsonpath "$.id"
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"
# -----------------------