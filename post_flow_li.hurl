# /post POST -------------
POST {{BASE_URL}}/api/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "linkedin"
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
jsonpath "$.postIds[0].platform" == "linkedin"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
li_id: jsonpath "$.postIds[0].id"
# -----------------------

# /delay GET
GET https://probe.ayrshare.com/delay?delay=60

HTTP 200

#-----------------------

# /analytics/post -------
#POST {{BASE_URL}}/api/analytics/post
#Content-Type: application/json
#Authorization: Bearer {{API_KEY}}
#{
#    "id": "{{id}}"
#}

#HTTP 200
#[Asserts]
#header "Content-Type" == "application/json; charset=utf-8"
#jsonpath "$.status" == "success"
#jsonpath "$.id" == "{{id}}"

#jsonpath "$.linkedin" exists
#jsonpath "$.linkedin.id" == "{{li_id}}"
#jsonpath "$.linkedin.postUrl" exists
#jsonpath "$.linkedin.analytics.shareCount" exists
#jsonpath "$.linkedin.analytics.likeCount" exists
#jsonpath "$.linkedin.analytics.engagement" exists
#jsonpath "$.linkedin.analytics.clickCount" exists
#jsonpath "$.linkedin.analytics.impressionCount" exists
#jsonpath "$.linkedin.analytics.commentCount" exists
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
