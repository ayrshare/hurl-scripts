# /post POST -------------
POST {{BASE_URL}}/api/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "twitter"
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
jsonpath "$.postIds[0].platform" == "twitter"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
tw_id: jsonpath "$.postIds[0].id"
# -----------------------

# /comments POST
POST {{BASE_URL}}/api/comments
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "id": "{{id}}",
    "platforms": ["twitter"],
    "randomComment": true
}

HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.twitter" exists
jsonpath "$.twitter.status" == "success"
# jsonpath "$.twitter.comment" == "hurl"

[Captures]
tw_comment_id: jsonpath "$.twitter.commentId"
tw_comment: jsonpath "$.twitter.comment"

# -----------------------

# /delay GET
GET https://probe.ayrshare.com/delay?delay=30

HTTP 200

# -----------------------


# /comments GET
GET {{BASE_URL}}/api/comments?id={{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.twitter" isCollection
jsonpath "$.twitter[0].commentId" == "{{tw_comment_id}}"
jsonpath "$.twitter[0].comment" == "{{tw_comment}}"
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

jsonpath "$.twitter" exists
jsonpath "$.twitter.id" == "{{tw_id}}"
jsonpath "$.twitter.postUrl" exists
jsonpath "$.twitter.analytics.created" exists
jsonpath "$.twitter.analytics.name" exists
jsonpath "$.twitter.analytics.nonPublicMetrics" exists
jsonpath "$.twitter.analytics.nonPublicMetrics.userProfileClicks" exists
jsonpath "$.twitter.analytics.nonPublicMetrics.impressionCount" exists
jsonpath "$.twitter.analytics.organicMetrics" exists
jsonpath "$.twitter.analytics.organicMetrics.likeCount" exists
jsonpath "$.twitter.analytics.organicMetrics.impressionCount" exists
jsonpath "$.twitter.analytics.organicMetrics.replyCount" exists
jsonpath "$.twitter.analytics.organicMetrics.retweetCount" exists
jsonpath "$.twitter.analytics.organicMetrics.userProfileClicks" exists
jsonpath "$.twitter.analytics.post" exists
jsonpath "$.twitter.analytics.publicMetrics" exists
jsonpath "$.twitter.analytics.publicMetrics.likeCount" exists
jsonpath "$.twitter.analytics.publicMetrics.quoteCount" exists
jsonpath "$.twitter.analytics.publicMetrics.replyCount" exists
jsonpath "$.twitter.analytics.publicMetrics.retweetCount" exists
jsonpath "$.twitter.analytics.username" exists
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
