# /post POST -------------
POST {{BASE_URL}}/api/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "pinterest"
    ],
    "randomMediaUrl": true
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.errors" count == 0

jsonpath "$.postIds[0].status" == "success"
jsonpath "$.postIds[0].id" exists
jsonpath "$.postIds[0].postUrl" exists
jsonpath "$.postIds[0].platform" == "pinterest"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
pi_id: jsonpath "$.postIds[0].id"
# -----------------------

# /analytics/post -------
POST {{BASE_URL}}/api/analytics/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "id": "{{id}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.pinterest" exists
jsonpath "$.pinterest.id" == "{{pi_id}}"
jsonpath "$.pinterest.postUrl" exists
jsonpath "$.pinterest.analytics.description" exists
jsonpath "$.pinterest.analytics.media" exists
jsonpath "$.pinterest.analytics.totalComments" exists
jsonpath "$.pinterest.analytics.totalReactions" exists

# -----------------------

# /post DELETE ---------
DELETE {{BASE_URL}}/api/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "id": "{{id}}"
}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"
jsonpath "$.code" == 200
# -----------------------