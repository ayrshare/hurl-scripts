# /post POST -------------
POST {{BASE_URL}}/post
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
POST {{BASE_URL}}/comments
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 15000
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
tw_comment_top_id: jsonpath "$.commentId"
# -----------------------

# /comments GET
GET {{BASE_URL}}/comments?id={{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 15000

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.twitter" isCollection
jsonpath "$.twitter[0].commentId" == "{{tw_comment_id}}"
jsonpath "$.twitter[0].comment" == "{{tw_comment}}"
# -----------------------

# /comments/reply POST
POST {{BASE_URL}}/comments/reply
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "commentId": "{{tw_comment_top_id}}",
    "platforms": [
        "twitter"
    ],
    "randomComment": true
}
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"
jsonpath "$.commentId" exists
jsonpath "$.twitter" exists
jsonpath "$.twitter.status" == "success"
jsonpath "$.twitter.commentId" exists
jsonpath "$.twitter.sourceCommentId" exists
jsonpath "$.twitter.comment" exists
jsonpath "$.twitter.platform" == "twitter"
# -----------------------

# /comments DELETE
DELETE {{BASE_URL}}/comments/{{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 10000

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.twitter" exists
# -----------------------

# /analytics/post -------
POST {{BASE_URL}}/analytics/post
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
DELETE {{BASE_URL}}/post
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
