# /post POST -------------
POST {{BASE_URL}}/api/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "facebook"
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
jsonpath "$.postIds[0].platform" == "facebook"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
fb_id: jsonpath "$.postIds[0].id"
# -----------------------

# /comments POST
POST {{BASE_URL}}/api/comments
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "id": "{{id}}",
    "platforms": ["facebook"],
    "comment": "hurl"
}

HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.facebook" exists
jsonpath "$.facebook.status" == "success"
jsonpath "$.facebook.comment" == "hurl"

[Captures]
fb_comment_id: jsonpath "$.facebook.commentId"
fb_comment: jsonpath "$.facebook.comment"
# -----------------------

# /delay GET
GET https://probe.ayrshare.com/delay?delay=10

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

jsonpath "$.facebook" isCollection
jsonpath "$.facebook[0].commentId" == "{{fb_comment_id}}"
jsonpath "$.facebook[0].comment" == "{{fb_comment}}"
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

jsonpath "$.facebook" exists
jsonpath "$.facebook.id" == "{{fb_id}}"
jsonpath "$.facebook.postUrl" exists
jsonpath "$.facebook.analytics.clicksUnique" exists
jsonpath "$.facebook.analytics.commentsCount" exists
jsonpath "$.facebook.analytics.engagedUsers" exists
jsonpath "$.facebook.analytics.impressionsUnique" exists
jsonpath "$.facebook.analytics.likeCount" exists
jsonpath "$.facebook.analytics.negativeFeedback" exists
jsonpath "$.facebook.analytics.negativeFeedbackUnique" exists
jsonpath "$.facebook.analytics.reactions" exists
jsonpath "$.facebook.analytics.reactionsByType" exists
jsonpath "$.facebook.analytics.sharesCount" exists
jsonpath "$.facebook.analytics.videoViewTime" exists
jsonpath "$.facebook.analytics.videoViews" exists
jsonpath "$.facebook.analytics.videoViewsUnique" exists
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