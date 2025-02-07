# /post POST -------------
POST {{BASE_URL}}/post
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "randomPost": true,
    "platforms": [
        "bluesky"
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
jsonpath "$.postIds[0].platform" == "bluesky"

jsonpath "$.id" exists
jsonpath "$.refId" exists
jsonpath "$.post" exists

[Captures]
id: jsonpath "$['id']"
bs_id: jsonpath "$.postIds[0].id"
# -----------------------

# /comments POST
POST {{BASE_URL}}/comments
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "id": "{{id}}",
    "platforms": ["bluesky"],
    "randomComment": true
}

HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.bluesky" exists
jsonpath "$.bluesky.status" == "success"

[Captures]
bs_comment_id: jsonpath "$.bluesky.commentId"
bs_comment: jsonpath "$.bluesky.comment"
bs_comment_top_id: jsonpath "$.commentId"
# -----------------------

# /comments GET
GET {{BASE_URL}}/comments?id={{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
[Options]
delay: 5000

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"

jsonpath "$.bluesky" isCollection
jsonpath "$.bluesky[0].commentId" == "{{bs_comment_id}}"
jsonpath "$.bluesky[0].comment" == "{{bs_comment}}"
# -----------------------

# /comments/reply POST
POST {{BASE_URL}}/comments/reply
Content-Type: application/json
Authorization: Bearer {{API_KEY}}
{
    "commentId": "{{bs_comment_top_id}}",
    "platforms": [
        "bluesky"
    ],
    "randomComment": true
}
HTTP 200

[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.id" == "{{id}}"
jsonpath "$.commentId" exists
jsonpath "$.bluesky" exists
jsonpath "$.bluesky.status" == "success"
jsonpath "$.bluesky.commentId" exists
jsonpath "$.bluesky.sourceCommentId" exists
jsonpath "$.bluesky.comment" exists
jsonpath "$.bluesky.platform" == "bluesky"
# -----------------------

# /comments DELETE
DELETE {{BASE_URL}}/comments/{{id}}
Content-Type: application/json
Authorization: Bearer {{API_KEY}}

HTTP 200
[Asserts]
header "Content-Type" == "application/json; charset=utf-8"
jsonpath "$.status" == "success"
jsonpath "$.bluesky" exists
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

jsonpath "$.bluesky" exists
jsonpath "$.bluesky.id" == "{{bs_id}}"
jsonpath "$.bluesky.postUrl" exists
jsonpath "$.bluesky.analytics.created" exists
jsonpath "$.bluesky.analytics.post" exists
jsonpath "$.bluesky.analytics.likeCount" exists
jsonpath "$.bluesky.analytics.quoteCount" exists
jsonpath "$.bluesky.analytics.replyCount" exists
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
