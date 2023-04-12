# /post POST -------------
POST {{BASE_URL}}/api/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "instagram"
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
jsonpath "$.postIds[0].usedQuota" > 0
jsonpath "$.postIds[0].platform" == "instagram"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
ig_id: jsonpath "$.postIds[0].id"
# -----------------------

# /comments POST
POST {{BASE_URL}}/api/comments
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "id": "{{id}}",
    "platforms": ["instagram"],
    "randomComment": true
}

HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.instagram" exists
jsonpath "$.instagram.status" == "success"
#jsonpath "$.instagram.comment" == "hurl"

[Captures]
ig_comment_id: jsonpath "$.instagram.commentId"
ig_comment: jsonpath "$.instagram.comment"
ig_comment_top_id: jsonpath "$.commentId"
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

jsonpath "$.instagram" isCollection
jsonpath "$.instagram[0].commentId" == "{{ig_comment_id}}"
jsonpath "$.instagram[0].comment" == "{{ig_comment}}"
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

jsonpath "$.instagram" exists
jsonpath "$.instagram.id" == "{{ig_id}}"
jsonpath "$.instagram.postUrl" exists
jsonpath "$.instagram.analytics.caption" exists
jsonpath "$.instagram.analytics.commentsCount" exists
jsonpath "$.instagram.analytics.created" exists
jsonpath "$.instagram.analytics.engagementCount" exists
jsonpath "$.instagram.analytics.impressionsCount" exists
jsonpath "$.instagram.analytics.likeCount" exists
jsonpath "$.instagram.analytics.mediaProductType" exists
jsonpath "$.instagram.analytics.mediaType" exists
jsonpath "$.instagram.analytics.reachCount" exists
jsonpath "$.instagram.analytics.savedCount" exists
jsonpath "$.instagram.analytics.username" exists
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