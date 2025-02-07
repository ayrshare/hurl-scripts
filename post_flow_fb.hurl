# /post POST -------------
POST {{BASE_URL}}/post
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
POST {{BASE_URL}}/comments
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 5000
{
    "id": "{{id}}",
    "platforms": ["facebook"],
    "randomComment": true
}
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.facebook" exists
jsonpath "$.facebook.status" == "success"
# jsonpath "$.facebook.comment" == "hurl"

[Captures]
fb_comment_id: jsonpath "$.facebook.commentId"
fb_comment: jsonpath "$.facebook.comment"
fb_comment_top_id: jsonpath "$.commentId"

# -----------------------

# /comments GET
GET {{BASE_URL}}/comments?id={{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 30000
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.facebook" isCollection
jsonpath "$.facebook[0].commentId" == "{{fb_comment_id}}"
jsonpath "$.facebook[0].comment" == "{{fb_comment}}"
# -----------------------

# /comments/reply POST
POST {{BASE_URL}}/comments/reply
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "commentId": "{{fb_comment_top_id}}",
    "platforms": [
        "facebook"
    ],
    "randomComment": true
}
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"
jsonpath "$.commentId" exists
jsonpath "$.facebook" exists
jsonpath "$.facebook.status" == "success"
jsonpath "$.facebook.commentId" exists
jsonpath "$.facebook.sourceCommentId" exists
jsonpath "$.facebook.comment" exists
jsonpath "$.facebook.platform" == "facebook"
# -----------------------

# /comments DELETE
DELETE {{BASE_URL}}/comments/{{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.facebook" exists
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

jsonpath "$.facebook" exists
jsonpath "$.facebook.id" == "{{fb_id}}"
jsonpath "$.facebook.postUrl" exists
#jsonpath "$.facebook.analytics.clicksUnique" exists
jsonpath "$.facebook.analytics.commentsCount" exists
#jsonpath "$.facebook.analytics.engagedUsers" exists
jsonpath "$.facebook.analytics.impressionsUnique" exists
jsonpath "$.facebook.analytics.likeCount" exists
# jsonpath "$.facebook.analytics.negativeFeedback" exists
# jsonpath "$.facebook.analytics.negativeFeedbackUnique" exists
jsonpath "$.facebook.analytics.reactions" exists
jsonpath "$.facebook.analytics.reactionsByType" exists
jsonpath "$.facebook.analytics.sharesCount" exists
jsonpath "$.facebook.analytics.videoViewTime" exists
jsonpath "$.facebook.analytics.videoViews" exists
jsonpath "$.facebook.analytics.videoViewsUnique" exists
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
